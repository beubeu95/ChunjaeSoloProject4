package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Faq;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FaqMapperImpl implements FaqMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Faq> faqList() throws Exception {
        return sqlSession.selectList("faq.faqList");
    }

    @Override
    public Faq faqDetail(int fno) throws Exception {
        return sqlSession.selectOne("faq.faqDetail");
    }

    @Override
    public void faqInsert(Faq faq) throws Exception {
        sqlSession.insert("faq.faqInsert", faq);
    }

    @Override
    public void faqEdit(Faq faq) throws Exception {
        sqlSession.update("faq.faqEdit", faq);
    }

    @Override
    public void faqDelete(int fno) throws Exception {
        sqlSession.delete("faq.faqDelete", fno);
    }

}
