package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommentLecPage;
import kr.ed.haebeop.util.CommentPage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
public interface CommentMapper {
    public List<Comment> commentList(CommentPage page) throws Exception;
    public List<Comment> lecCommentList(CommentLecPage page) throws Exception;
    public int getCount(int bno) throws Exception;
    public int getLecCount(int lno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void LecCommentInsert(Comment comment) throws Exception;
    public void communityDelete(int comNo) throws Exception;
}
