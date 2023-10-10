package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class BoardMapperImpl implements BoardMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return sqlSession.selectList("board.boardList", page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("board.getCount", page);
    }

    @Override
    public List<Category> categeryList() throws Exception {
        return sqlSession.selectList("board.cateList");
    }

    @Transactional
    @Override
    public BoardVO boardDetail(int bno) throws Exception {
        sqlSession.update("board.cntCount", bno);
        return sqlSession.selectOne("board.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board board) throws Exception {
        sqlSession.insert("board.boardInsert", board);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("board.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board board) throws Exception {
        sqlSession.update("board.boardEdit", board);
    }
}
