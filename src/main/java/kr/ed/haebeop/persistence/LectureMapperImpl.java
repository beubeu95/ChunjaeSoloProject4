package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
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

    @Override
    public int canApply(int lno) throws Exception {
        return sqlSession.selectOne("lecture.canApply", lno);
    }

    @Override
    public void lectureInsert(Lecture lecture) throws Exception {
        sqlSession.insert("lecture.lectureInsert", lecture);
    }

    @Override
    public void writeArticle(Lecture lecture) throws Exception {
        sqlSession.insert("lecture.writeLno", lecture);
    }

    @Override
    public void fileRegister(Lecture lecture) throws Exception {
        sqlSession.update("lecture.fileRegister", lecture);
    }

    @Override
    public List<LectureVO> lectureList2() throws Exception {
        return sqlSession.selectList("lecture.lectureList");
    }

    @Override
    public List<Teacher> tList() { return sqlSession.selectList("lecture.teacherList");}

    @Override
    public List<Teacher> tnameList() throws Exception { return sqlSession.selectList("lecture.tnameList"); }

    @Override
    public List<Book> bnameList() throws Exception { return sqlSession.selectList("lecture.bnameList"); }

    @Override
    public void teacherDelete(String tcode) throws Exception { sqlSession.delete("lecture.teacherDelete", tcode); }

}
