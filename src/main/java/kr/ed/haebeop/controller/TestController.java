package kr.ed.haebeop.controller;


import kr.ed.haebeop.domain.Test;

import kr.ed.haebeop.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/test/")
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("testList")
    public String getTestList(Model model) throws Exception {
        List<Test> testList = testService.testList();
        model.addAttribute("testList", testList);
        return "/test/testList";
    }

}