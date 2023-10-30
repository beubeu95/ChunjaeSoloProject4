package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureMapper {
    public List<LectureVO> lectureList(Page page) throws Exception;
    public List<LectureVO> lectureList2() throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public LectureVO getLecture (int lno) throws Exception;
    public int canApply(int lno) throws Exception;
    public void lectureInsert(Lecture lecture) throws Exception;
    public List<Teacher> tList () throws Exception;
    public List<Book> bnameList() throws Exception;
    public List<Teacher> tnameList() throws Exception;
    public void teacherDelete(String tcode) throws Exception;
    public List<LectureVO> getLectureList2() throws Exception;
    public void writeArticle(Lecture lecture) throws Exception;
    public void fileRegister(Lecture lecture) throws Exception;
    public void lectureUpdate(Lecture lecture) throws Exception;


}
