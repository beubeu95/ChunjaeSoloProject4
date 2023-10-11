package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface BoardMapper {
    public List<BoardVO> boardList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categoryList() throws Exception;
    public BoardVO boardDetail(int bno) throws Exception;
    public void boardInsert(Board board) throws Exception;
    public void boardDelete(int bno) throws Exception;
    public void boardEdit(Board board) throws Exception;
}
