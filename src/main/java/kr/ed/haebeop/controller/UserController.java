package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping("term.do")
    public String term(Model model) {
        return "/user/term";
    }

    @RequestMapping("join.do")
    public String join(Model model) {
        return "/user/join";
    }

    @RequestMapping(value="join.do", method= RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model) throws Exception {
        User user = new User();
        String ppw = request.getParameter("pw");
        String pw = pwEncoder.encode(ppw);
        user.setId(request.getParameter("id"));
        user.setPw(pw);
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setTel(request.getParameter("tel"));
        user.setAddr1(request.getParameter("addr1"));
        user.setAddr2(request.getParameter("addr2"));
        user.setPostcode(request.getParameter("postcode"));
        user.setBirth(request.getParameter("birth"));
        userService.userInsert(user);

        return "/user/login";
    }

    @RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = userService.idCheck(id);

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @RequestMapping("login.do")
    public String userLoginForm(Model model) throws Exception {
        return "/user/login";
    }

    @RequestMapping(value = "loginpro.do", method = RequestMethod.POST)
    public String userLogin(@RequestParam String id, @RequestParam String pw, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        boolean ps = userService.loginCheck(id, pw);

        // 로그인 성공 시
        if(ps){
            session.setAttribute("sid", id);
            userService.updateVisited(id);
            System.out.println("성공");
            return "redirect:/";
        } else {
            System.out.println("실패");
            return "redirect:login.do";
        }
    }

    @GetMapping("logout.do")
    public String userLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception{
        String id =(String) session.getAttribute("sid");
        User user=userService.getUser(id);

        model.addAttribute("user", user);
        return "/user/mypageIndex";
    }

    @GetMapping("userUpdate.do")
    public String updateForm(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);

        model.addAttribute("user", user);
        return "/user/mypage";
    }

    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String userUpdate(User user, Model model) throws Exception {
        String pwd = "";
        if(user.getPw().length()<=16) {
            pwd = pwEncoder.encode(user.getPw());
            user.setPw(pwd);
        }
        userService.userEdit(user);
        return "redirect:/user/mypageIndex";
    }

    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.userDelete(id);
        session.invalidate();
        return "redirect:/";
    }

}
