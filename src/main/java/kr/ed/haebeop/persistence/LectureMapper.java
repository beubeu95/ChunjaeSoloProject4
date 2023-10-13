package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureMapper {
    public List<LectureVO> lectureList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public LectureVO getLecture (int lno) throws Exception;
}
