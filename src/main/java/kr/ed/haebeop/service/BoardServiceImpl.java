package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.persistence.BoardMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return boardMapper.boardList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return boardMapper.getCount(page);
    }

    @Override
    public List<Category> categoryList() throws Exception {
        return boardMapper.categoryList();
    }

    @Override
    public BoardVO boardDetail(int bno) throws Exception {
        return boardMapper.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board board) throws Exception {
        boardMapper.boardInsert(board);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardMapper.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board board) throws Exception {
        boardMapper.boardEdit(board);
    }
}
