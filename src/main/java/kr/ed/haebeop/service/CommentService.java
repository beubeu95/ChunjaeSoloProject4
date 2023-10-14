package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommentLecPage;
import kr.ed.haebeop.util.CommentPage;

import java.util.List;

public interface CommentService {
    public List<Comment> commentList(CommentPage page) throws Exception;
    public List<Comment> lecCommentList(CommentLecPage page) throws Exception;
    public int getCount(int bno) throws Exception;
    public int getLecCount(int lno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void LecCommentInsert(Comment dto) throws Exception;
    public void communityDelete(int comNo) throws Exception;

}
