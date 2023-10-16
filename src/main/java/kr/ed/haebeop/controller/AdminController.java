package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.DeliveryService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.service.UserService;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private DeliveryService deliveryService;

    @Autowired
    private PaymentService paymentService;

    @GetMapping("index.do")
    public String getAdminIndex(Model model) {

        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);

        model.addAttribute("user", user);

        return "/admin/adminIndex";
    }

    @GetMapping("list.do")
    public String getUserList(Model model) throws Exception {

        List<User> list = userService.userList();

        model.addAttribute("list", list);

        return "/admin/userList";
    }

    @GetMapping("tlist.do")
    public String getTeacherList(Model model) throws Exception {
        List<Teacher> tlist = lectureService.tList();
        model.addAttribute("tlist", tlist);

        return "/admin/teacherList";
    }

    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String teacherDelete(@RequestParam String tcode, Model model, HttpSession session) throws Exception {
        lectureService.teacherDelete(tcode);
        session.invalidate();
        return "redirect:/admin/tlist.do";
    }

    @GetMapping("lecList.do")
    public String lecList(HttpServletRequest request, Model model) throws Exception {

        String category = request.getParameter("cate");

        BoardPage page = new BoardPage();
        page.setCategory(category);


        List<LectureVO> lectureList = lectureService.lectureList(page);
        List<Category> categories = lectureService.categoryList();

        model.addAttribute("list", lectureList);          // 게시글 목록
        model.addAttribute("categories", categories);       // 카테고리 목록
        model.addAttribute("curCategory", category);        // 현재 카테고리

        return "/admin/lectureList";

    }

    @GetMapping("insert.do")
    public String lectureInsertForm(Model model) throws Exception{
        List<Teacher> tnameList = lectureService.tnameList();
        List<Book> bnameList = lectureService.bnameList();

        model.addAttribute("tList", tnameList);
        model.addAttribute("bList", bnameList);
        return "/lecture/lectureInsert";
    }

    @PostMapping("insert.do")
    public String lectureInsert(HttpServletRequest request, Model model) throws Exception{
        Lecture lecture= new Lecture();
        lecture.setCate(request.getParameter("cate"));
        lecture.setTitle(request.getParameter("title"));
        lecture.setContent(request.getParameter("content"));
        lecture.setPrice(request.getParameter("price"));
        lecture.setTdate(request.getParameter("tdate"));
        lecture.setSdate(request.getParameter("sdate"));
        lecture.setEdate(request.getParameter("edate"));
        lecture.setBcode(request.getParameter("bcode"));
        lecture.setTcode(request.getParameter("tcode"));
        lecture.setStatus(request.getParameter("status"));
        lecture.setAmt(Integer.parseInt(request.getParameter("amt")));
        lectureService.lectureInsert(lecture);

        return "redirect:/admin/index.do";
    }


    @GetMapping("dlist.do")
    public String getdeliveryList(Model model) throws Exception{

        List<DeliveryVO> list = deliveryService.deliveryList();
        List<Delivery> delList = paymentService.deliveryList();
        model.addAttribute("list", list);
        model.addAttribute("delList", delList);
        return "/admin/deliveryList";
    }

    @GetMapping("delUpdate.do")
    public String deliveryDetail(HttpServletRequest request, Model model) throws Exception{
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryVO delivery= deliveryService.getdelivery(dno);

        model.addAttribute("delivery", delivery);

        return "/admin/deliveryUpdate";
    }

    @PostMapping("UpdateDeliveryPro.do")
    public String deliveryUpdate(HttpServletRequest request, Model model) throws Exception {

        Delivery del = new Delivery();
        del.setDcom(request.getParameter("dcom"));
        del.setDtel(request.getParameter("dtel"));
        del.setEdate(request.getParameter("edate"));
        del.setDcode(request.getParameter("dcode"));
        deliveryService.deliveryUpdate(del);

        return "redirect:/admin/dlist.do";
    }

}
