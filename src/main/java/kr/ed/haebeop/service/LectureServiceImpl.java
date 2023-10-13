package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.persistence.LectureMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{

    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<LectureVO> lectureList(Page page) throws Exception {
        return lectureMapper.lectureList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return lectureMapper.getCount(page);
    }

    @Override
    public List<Category> categoryList() throws Exception {
        return lectureMapper.categoryList();
    }

    @Override
    public LectureVO getLecture(int lno) throws Exception {
        return lectureMapper.getLecture(lno);
    }
}
