package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.persistence.CommentMapper;
import kr.ed.haebeop.util.CommentLecPage;
import kr.ed.haebeop.util.CommentPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> lecCommentList(CommentLecPage page) throws Exception {
        return commentMapper.lecCommentList(page);
    }

    @Override
    public List<Comment> commentList(CommentPage page) throws Exception {
        return commentMapper.commentList(page);
    }

    @Override
    public int getCount(int bno) throws Exception {
        return commentMapper.getCount(bno);
    }

    @Override
    public int getLecCount(int lno) throws Exception {
        return commentMapper.getLecCount(lno);
    }

    @Override
    public void LecCommentInsert(Comment dto) throws Exception {
        commentMapper.LecCommentInsert(dto);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentMapper.commentInsert(dto);
    }

    @Override
    public void communityDelete(int comNo) throws Exception {
        commentMapper.communityDelete(comNo);
    }
}
