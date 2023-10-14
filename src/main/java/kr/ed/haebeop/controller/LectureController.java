package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.CommentService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.CommentLecPage;
import kr.ed.haebeop.util.CommentPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/lecture/")
public class LectureController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private CommentService commentService;

    @GetMapping("list.do")
    public String getLectureList (HttpServletRequest request,Model model) throws Exception{

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String category = request.getParameter("cate");

        BoardPage page = new BoardPage();
        page.setCategory(category);                                // 카테고리 데이터 SET

        int total = lectureService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<LectureVO> lectureList = lectureService.lectureList(page);
        List<Category> categories = lectureService.categoryList();

        model.addAttribute("list", lectureList);          // 게시글 목록
        model.addAttribute("categories", categories);       // 카테고리 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("curCategory", category);        // 현재 카테고리
        model.addAttribute("page", page);                   // 페이징 데이터


        return "/lecture/lectureList";
    }

    @GetMapping("getLecture.do")
    public String getLecture(HttpServletRequest request, Model model) throws Exception {
        LectureVO lecture = lectureService.getLecture(Integer.parseInt(request.getParameter("lno")));

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int commentPage = request.getParameter("commentPage") != null ? Integer.parseInt(request.getParameter("commentPage")) : 1;

        CommentLecPage page = new CommentLecPage();

        int total = commentService.getLecCount(lecture.getLno());
        page.setLno(lecture.getLno());
        page.makeBlock(commentPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(commentPage, total);

        List<Comment> commentList = commentService.lecCommentList(page);

        model.addAttribute("lecture", lecture);
        model.addAttribute("commentList", commentList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("commentPage", commentPage);
        model.addAttribute("page", page);
        model.addAttribute("cate", request.getParameter("cate"));
        return "/lecture/lectureDetail";
    }

}
