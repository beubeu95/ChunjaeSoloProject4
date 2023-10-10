package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.service.BoardService;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.CommentPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    HttpSession session;

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("list.do")
    private String boardList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String category = request.getParameter("cate");

        BoardPage page = new BoardPage();
        page.setCategory(category);                                // 카테고리 데이터 SET
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = boardService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<BoardVO> communityList = boardService.boardList(page);
        List<Category> categories = boardService.categeryList();

        model.addAttribute("list", communityList);          // 게시글 목록
        model.addAttribute("categories", categories);       // 카테고리 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("curCategory", category);        // 현재 카테고리
        model.addAttribute("page", page);                   // 페이징 데이터

        return "/board/boardList";
    }

    @GetMapping("getBoard.do")
    public String boardDetail(HttpServletRequest request, Model model) throws Exception {
        BoardVO comm = boardService.boardDetail(Integer.parseInt(request.getParameter("bno")));

        // 게시판 목록에서 사용자가 선택한 게시물이 속해있는 페이지
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        // 댓글 목록의 페이지
        int commentPage = request.getParameter("commentPage") != null ? Integer.parseInt(request.getParameter("commentPage")) : 1;

        // 댓글 페이징 처리
        CommentPage page = new CommentPage();
        // 페이징에 필요한 데이터 저장
        int total = commentService.getCount(comm.getCno());
        page.setCno(comm.getCno());
        page.makeBlock(commentPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(commentPage, total);

        List<Comment> commentList = commentService.commentList(page);

        model.addAttribute("detail", comm);
        model.addAttribute("commentList", commentList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("commentPage", commentPage);
        model.addAttribute("page", page);
        model.addAttribute("cate", request.getParameter("cate"));
        model.addAttribute("type", request.getParameter("type"));
        model.addAttribute("keyword", request.getParameter("keyword"));
        return "/board/boardDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        List<Category> categories = boardService.categeryList();
        model.addAttribute("categories", categories);
        return "/board/boardInsert";
    }

    @PostMapping("insert.do")
    public String boardInsert(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Board board = new Board();
        board.setCate(request.getParameter("cate"));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setAuthor((String) session.getAttribute("sid"));

        boardService.boardInsert(board);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(@RequestParam int bno, Model model) throws Exception {
        BoardVO comm = boardService.boardDetail(bno);
        List<Category> categories = boardService.categeryList();
        model.addAttribute("detail", comm);
        model.addAttribute("categories", categories);
        return "/board/boardUpdate";
    }

    @PostMapping("edit.do")
    public String boardEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board board = new Board();
        board.setBno(bno);
        board.setCate(request.getParameter("cate"));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        boardService.boardEdit(board);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String boardDelete(@RequestParam int bno, Model model) throws Exception {
        boardService.boardDelete(bno);
        return "redirect:list.do";
    }
}
