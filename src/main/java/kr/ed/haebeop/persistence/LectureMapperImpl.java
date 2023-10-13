package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureMapperImpl implements LectureMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<LectureVO> lectureList(Page page) throws Exception {
        return sqlSession.selectList("lecture.lectureList",page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("lecture.getCount", page);
    }

    @Override
    public List<Category> categoryList() throws Exception {
        return sqlSession.selectList("lecture.cateList");
    }

    @Override
    public LectureVO getLecture(int lno) throws Exception {
        return sqlSession.selectOne("lecture.lectureDetail", lno);
    }
}
