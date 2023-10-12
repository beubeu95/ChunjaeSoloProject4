package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/faq/")
public class FaqController {

    @Autowired
    private FaqService faqService;

    @GetMapping("list.do")
    public String getFaqList(Model model) throws Exception{
        List<Faq> faqList = faqService.faqList();
        model.addAttribute("faqList", faqList);

        return "/faq/faqList";
    }
    @GetMapping("insert.do")
    public String faqInsertForm(HttpServletRequest request, Model model) throws Exception{
        return "/faq/faqInsert";
    }

    @PostMapping("insert.do")
    public String faqInsert(HttpServletRequest request, Model model) throws Exception{
        Faq faq = new Faq();
        faq.setTitle(request.getParameter("title"));
        faq.setContent(request.getParameter("content"));
        faqService.faqInsert(faq);
        return "redirect:list.do";
    }
    @GetMapping("edit.do")
    public String faqEditForm(HttpServletRequest request, Model model) throws Exception{
        int fno = Integer.parseInt(request.getParameter("fno"));

        Faq faq = faqService.faqDetail(fno);
        model.addAttribute("faq", faq);

        return "/faq/faqEdit";
    }

    @PostMapping("edit.do")
    public String FaqEdit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        int fno = Integer.parseInt(request.getParameter("fno"));
        Faq faq = new Faq();
        faq.setFno(fno);
        faq.setTitle(request.getParameter("title"));
        faq.setContent(request.getParameter("content"));
        faqService.faqEdit(faq);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String faqDelete(HttpServletRequest request, Model model) throws Exception{
        int fno = Integer.parseInt(request.getParameter("fno"));
        faqService.faqDelete(fno);

        return "redirect:list.do";
    }
}
