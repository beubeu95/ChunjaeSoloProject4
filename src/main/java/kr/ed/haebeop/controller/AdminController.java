package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.UserService;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        List<Teacher> tlist = userService.tList();
        model.addAttribute("tlist", tlist);

        return "/admin/teacherList";
    }

    @GetMapping("delete.do")
    public String teacherDelete(HttpServletRequest request, Model model) throws Exception {
        String tcode = request.getParameter("tcode");
        userService.teacherDelete(tcode);
        return "redirect:/admin/teacherList";
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
        return "/lecture/lectureInsert";
    }




}
