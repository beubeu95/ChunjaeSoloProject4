package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {
    public List<LectureVO> lectureList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public LectureVO getLecture (int lno) throws Exception;
}
