package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {

    @Autowired
    private LectureService lectureService;

    @RequestMapping("/")
    public String home (Model model)  throws Exception {

        List<LectureVO> popularLectures = lectureService.getLectureList2();
        model.addAttribute("popularLectures", popularLectures);

        return "/index";
    }
}
