package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Book;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        String bcode = (String) request.getParameter("bcode");

        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);

        Lecture lecture = paymentService.getLecture(lno);
        Book book = paymentService.getBook(bcode);

        model.addAttribute("user", user);
        model.addAttribute("lecture", lecture);
        model.addAttribute("book", book);

        return "/lecture/lecturePayment";

    }



}
