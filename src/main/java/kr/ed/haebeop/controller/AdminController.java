package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private DeliveryService deliveryService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private FileInfoService fileInfoService;

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
        List<Teacher> tlist = lectureService.tList();
        model.addAttribute("tlist", tlist);

        return "/admin/teacherList";
    }

    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String teacherDelete(@RequestParam String tcode, Model model, HttpSession session) throws Exception {
        lectureService.teacherDelete(tcode);
        session.invalidate();
        return "redirect:/admin/tlist.do";
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

        List<Category> categories = lectureService.categoryList();
        List<Teacher> tnameList = lectureService.tnameList();
        List<Book> bnameList = lectureService.bnameList();

        model.addAttribute("categories", categories);
        model.addAttribute("tList", tnameList);
        model.addAttribute("bList", bnameList);
        return "/admin/lectureInsert";
    }

    @PostMapping("insert.do")
    public String write(Lecture lecture, @RequestParam("upfile") MultipartFile[] files, Model model, HttpServletRequest req) throws Exception {

        String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/"); // 경로설정
        System.out.println("path : " + realPath);
        String today = new SimpleDateFormat("yyMMdd").format(new Date()); //오늘 날짜
        String saveFolder = realPath + today; // 저장되는 폴더 경로
        System.out.println(saveFolder);
        File folder = new File(saveFolder);
        if (!folder.exists()) // 폴더가 존재하지 않으면 생성함
            folder.mkdirs();
        List<FileInfo> fileInfos = new ArrayList<>(); //첨부파일 정보를 리스트로 생성
        for (MultipartFile mfile : files) {
            FileInfo fileInfoDto = new FileInfo();
            String originalFileName = mfile.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
            if (!originalFileName.isEmpty()) {
                String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                fileInfoDto.setSaveFolder(today); // 파일인포 객체에 값저장
                fileInfoDto.setOriginFile(originalFileName); // 파일인포 객체에 값저장
                fileInfoDto.setSaveFile(saveFileName); // 파일인포 객체에 값저장
                System.out.println(mfile.getOriginalFilename() + "   " + saveFileName);
                mfile.transferTo(new File(folder, saveFileName)); // 파일을 업로드 폴더에 저장
            }
            fileInfos.add(fileInfoDto);
        }


        lecture.setFileInfos(fileInfos);
        lectureService.lectureInsert(lecture);


        return "redirect:/admin/index.do";
    }


    @GetMapping("dlist.do")
    public String getdeliveryList(Model model) throws Exception{

        List<DeliveryVO> list = deliveryService.deliveryList();
        model.addAttribute("list", list);
        return "/admin/deliveryList";
    }

    @GetMapping("delUpdate.do")
    public String deliveryDetail(HttpServletRequest request, Model model) throws Exception{
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryVO delivery= deliveryService.getdelivery(dno);

        String[] str = delivery.getAddr().split("<br>");
        String addrNew= str[0]+str[1];
        model.addAttribute("addrNew", addrNew);
        model.addAttribute("delivery", delivery);

        return "/admin/deliveryUpdate";
    }

    @PostMapping("UpdateDeliveryPro.do")
    public String deliveryUpdate(HttpServletRequest request, Model model) throws Exception {

        Delivery del = new Delivery();
        del.setDcom(request.getParameter("dcom"));
        del.setDtel(request.getParameter("dtel"));
        del.setEdate(request.getParameter("edate"));
        del.setDcode(request.getParameter("dcode"));
        deliveryService.deliveryUpdate(del);

        return "redirect:/admin/dlist.do";
    }

    @RequestMapping("lectureEdit")
    public String lectureEditForm(@RequestParam int lno, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        LectureVO lecture = lectureService.getLecture(lno);
        model.addAttribute("detail", lecture);

        // 과목 목록 불러오기
        List<Category> categories = lectureService.categoryList();
        model.addAttribute("categories", categories);


        model.addAttribute("curPage", curPage);

        return "/admin/lectureEdit";
    }



}
