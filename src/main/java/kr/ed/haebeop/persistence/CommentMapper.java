package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.CommentPage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    public List<Comment> commentList(CommentPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void communityDelete(int comNo) throws Exception;
}
