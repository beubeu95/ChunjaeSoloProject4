package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class NoticeMapperImpl implements NoticeMapper {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Notice> noticeList(Page page) throws Exception {
        return sqlSession.selectList("notice.noticeList", page);
    }

    @Override
    public List<Notice> noticeListLimit() throws Exception {
        return sqlSession.selectList("notice.noticeListLimit");
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("notice.getCount", page);
    }
    @Transactional
    @Override
    public Notice noticeDetail(int no) throws Exception {
        sqlSession.update("notice.countUp", no);
        return sqlSession.selectOne("notice.noticeDetail", no);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        sqlSession.insert("notice.noticeInsert", notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        sqlSession.delete("notice.noticeDelete", no);
    }

    @Override
    public void noticeEdit(Notice notice) throws Exception {
        sqlSession.update("notice.noticeEdit", notice);
    }
}
