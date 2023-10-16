package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
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
    public List<Teacher> tList() throws Exception {
        return lectureMapper.tList();
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

    @Override
    public int canApply(int lno) throws Exception {
        return lectureMapper.canApply(lno);
    }

    @Override
    public void lectureInsert(Lecture lecture) throws Exception {
        lectureMapper.lectureInsert(lecture);
    }

    @Override
    public List<Teacher> tnameList() throws Exception {
        return lectureMapper.tnameList();
    }

    @Override
    public List<Book> bnameList() throws Exception {
        return lectureMapper.bnameList();
    }

    @Override
    public void teacherDelete(String tcode) throws Exception {
        lectureMapper.teacherDelete(tcode);
    }
}
