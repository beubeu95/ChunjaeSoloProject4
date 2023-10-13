package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.ReviewService;
import kr.ed.haebeop.util.BoardPage;
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
    private ReviewService reviewService;

    @GetMapping("list.do")
    public String getLectureList (HttpServletRequest request,Model model) throws Exception{

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String category = request.getParameter("cate");

        BoardPage page = new BoardPage();
        page.setCategory(category);                                // 카테고리 데이터 SET
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
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
        int lno =Integer.parseInt(request.getParameter("lno"));
        LectureVO lecture = lectureService.getLecture(lno);
        List<Review> review =reviewService.reviewList(lno);

        // 게시판 목록에서 사용자가 선택한 게시물이 속해있는 페이지
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        model.addAttribute("review", review);
        model.addAttribute("lecture", lecture);
        model.addAttribute("curPage", curPage);
        model.addAttribute("cate", request.getParameter("cate"));
        return "/lecture/lectureDetail";
    }

}
