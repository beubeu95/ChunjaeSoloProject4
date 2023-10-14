package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommentLecPage;
import kr.ed.haebeop.util.CommentPage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentMapperImpl implements CommentMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Comment> commentList(CommentPage page) throws Exception {
        return sqlSession.selectList("comment.commentList", page);
    }

    @Override
    public List<Comment> lecCommentList(CommentLecPage page) throws Exception {
        return sqlSession.selectList("comment.lecCommentList", page);
    }

    @Override
    public int getCount(int bno) throws Exception {
        return sqlSession.selectOne("comment.getCount", bno);
    }

    @Override
    public int getLecCount(int lno) throws Exception {
        return sqlSession.selectOne("comment.getLecCount", lno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        sqlSession.insert("comment.commentInsert", dto);
    }

    @Override
    public void LecCommentInsert(Comment comment) throws Exception {
        sqlSession.insert("comment.lecCommentInsert", comment);
    }

    @Override
    public void communityDelete(int comNo) throws Exception {
        sqlSession.delete("comment.commentDelete", comNo);
    }

}
