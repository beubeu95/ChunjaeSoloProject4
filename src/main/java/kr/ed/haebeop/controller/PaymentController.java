package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.DeliveryService;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment/")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Autowired
    private DeliveryService deliveryService;

    @RequestMapping(value = "payCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> appCheck(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        int lno = Integer.parseInt(request.getParameter("lno"));

        boolean result = paymentService.payCheck(id, lno);
        Payment payment = paymentService.getPayment(id, lno);

        int curApp = paymentService.getCount(lno);

        if (result) {
            result = true;
        } else {
            // 이미 수강신청한 경우
            if (payment.getLno() == lno) {
                result = false; // 해당 강의에 대한 신청은 거부
            } else {
                result = true; // 다른 신청에 대한 신청은 허용
            }
        }

        Map<String, Object> response = new HashMap<>();
        response.put("result", result);
        response.put("curApp", curApp);
        return response;
    }



    @GetMapping("payment.do")
    public String getpaymentForm (HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        String bcode = request.getParameter("bcode");

        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);

        Lecture lecture = paymentService.getLecture(lno);
        Book book = paymentService.getBook(bcode);

        model.addAttribute("user", user);
        model.addAttribute("lecture", lecture);
        model.addAttribute("book", book);

        return "/lecture/lecturePayment";

    }

    @PostMapping("paymentPro.do")
    public String paymentPro(HttpServletRequest request, Model model, HttpSession session) throws Exception {


            int lno = Integer.parseInt(request.getParameter("lno"));
            String bcode = request.getParameter("bcode");
            String id = (String) session.getAttribute("sid");
            int pt = Integer.parseInt(request.getParameter("pt"));


            Payment payment = new Payment();
            payment.setLno(lno);
            payment.setTitle(request.getParameter("title"));
            payment.setBcode(bcode);
            payment.setId(id);
            payment.setTcode(request.getParameter("tcode"));
            payment.setMethod(request.getParameter("method"));
            payment.setCom(request.getParameter("com"));
            payment.setPrice(request.getParameter("price"));
            payment.setAccount(request.getParameter("account"));

            int pno = paymentService.paymentInsert(payment);

            Delivery delivery = new Delivery();
            delivery.setPno(pno);
            delivery.setId(id);
            delivery.setAddr(request.getParameter("addr1") + "<br>" + request.getParameter("addr2") + "<br>" + request.getParameter("postcode"));
            delivery.setTel(request.getParameter("tel"));


            Serve serve = new Serve();
            serve.setBcode(bcode);
            serve.setSprice(request.getParameter("sprice"));
            serve.setAmount(request.getParameter("amount"));


            paymentService.addPayment(delivery, serve, pt, id);

            return "redirect:/user/myLecture.do";
    }

    @GetMapping("payDetail")
    public String getPayment(HttpServletRequest request, Model model) throws Exception{
        int pno = Integer.parseInt(request.getParameter("pno"));
        PaymentVO payment = paymentService.myPaymentDetail(pno);
        model.addAttribute("payment", payment);
        return "/user/payDetail";
    }

    @GetMapping("deliveryDetail")
    public String getDelivery(HttpServletRequest request, Model model) throws Exception{
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryVO delivery = deliveryService.myDeliveryDetail(dno);
        model.addAttribute("delivery", delivery);
        return "/user/deliveryDetail";
    }

    @GetMapping("paymentDelete")
    @ResponseBody
    public ResponseEntity<String> getPaymentDelete(@RequestParam int lno, @RequestParam int pno, HttpSession session, Model model) {
        String id = (String) session.getAttribute("sid");
        try {
            paymentService.deletePayment(lno, id, pno);
            return new ResponseEntity<>("구매취소 성공", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("구매취소 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
