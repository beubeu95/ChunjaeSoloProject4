package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    @GetMapping("index.do")
    public String getAdminIndex (Model model) {

        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);

        model.addAttribute("user", user);

        return "/admin/adminIndex";
    }
}
