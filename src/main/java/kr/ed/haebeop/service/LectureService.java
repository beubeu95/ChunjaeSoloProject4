package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {
    public List<LectureVO> lectureList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public LectureVO getLecture (int lno) throws Exception;
    public int canApply(int lno) throws Exception;
    public void lectureInsert(Lecture lecture) throws Exception;
    public List<Teacher> tList() throws Exception;
    public List<Teacher> tnameList() throws Exception;
    public List<Book> bnameList() throws Exception;
    public void teacherDelete(String tcode) throws Exception;
}
