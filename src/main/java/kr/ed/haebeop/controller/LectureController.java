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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

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
        int canApp = lectureService.canApply(Integer.parseInt(request.getParameter("lno")));


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
        model.addAttribute("canApp", canApp);
        model.addAttribute("commentList", commentList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("commentPage", commentPage);
        model.addAttribute("page", page);
        model.addAttribute("cate", request.getParameter("cate"));
        return "/lecture/lectureDetail";
    }

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value="imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "D:\\hk\\project\\pro04\\pro04\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
            //String path = request.getRealPath("/resource/uploadckImage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = request.getContextPath() + "/board/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid, @RequestParam(value="fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //서버에 저장된 이미지 경로
        String path = "D:\\hk\\project\\pro04\\pro04\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
        //String path = request.getRealPath("/resource/uploadckImage/");
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

}
