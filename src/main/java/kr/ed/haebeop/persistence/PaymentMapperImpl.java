package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Repository
public class PaymentMapperImpl implements PaymentMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public Payment getPayment(String id, int lno) throws Exception {
        Map<String, Object> payment = new HashMap<>();
        payment.put("id", id);
        payment.put("lno", lno);

        return sqlSession.selectOne("payment.paymentDetail", payment);
    }

    @Override
    public int getCount(int lno) throws Exception {
        return sqlSession.selectOne("payment.getCount", lno);
    }

    @Override
    public Lecture getLecture(int lno) throws Exception {
        return sqlSession.selectOne("payment.lectureDetail", lno);
    }

    @Override
    public Book getBook(String bcode) throws Exception {
        return sqlSession.selectOne("payment.bookDetail", bcode);
    }

    @Transactional
    @Override
    public void paymentInsert(Delivery delivery, Payment payment, Serve serve) throws Exception {
        sqlSession.insert("payment.deliveryInsert", delivery);
        sqlSession.selectOne("payment.deliveryNo");
        sqlSession.insert("payment.paymentInsert", payment);
        sqlSession.insert("payment.serveInsert", serve);
        sqlSession.selectOne("payment.paymentNo");

    }
}
