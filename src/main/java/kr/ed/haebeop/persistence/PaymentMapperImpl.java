package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PaymentMapperImpl implements PaymentMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int getCount(int lno) throws Exception { return sqlSession.selectOne("payment.getCount", lno); }
    @Override
    public Lecture getLecture(int lno) throws Exception { return sqlSession.selectOne("payment.lectureDetail", lno); }
    @Override
    public Book getBook(String bcode) throws Exception { return sqlSession.selectOne("payment.bookDetail", bcode); }
    @Override
    public int paymentNo() throws Exception { return sqlSession.selectOne("payment.paymentNo"); }
    @Override
    public void pointUpdate(String id) throws Exception { sqlSession.update("payment.pointUpdate", id); }
    @Override
    public List<Delivery> deliveryList() throws Exception { return sqlSession.selectList("payment.deliveryList"); }
    @Override
    public void deliveryInsert(Delivery delivery){ sqlSession.insert("payment.deliveryInsert", delivery); }
    @Override
    public void paymentInsert(Payment payment){
        sqlSession.insert("payment.paymentInsert", payment);
    }
    @Override
    public void serveInsert(Serve serve){
        sqlSession.insert("payment.serveInsert", serve);
    }

    @Override
    public Payment getPayment(String id, int lno) throws Exception {
        Map<String, Object> payment = new HashMap<>();
        payment.put("id", id);
        payment.put("lno", lno);

        return sqlSession.selectOne("payment.paymentDetail", payment);
    }

    @Transactional
    @Override
    public void addPayment (Delivery delivery, Serve serve, String id) throws Exception {
        deliveryInsert(delivery);
        serveInsert(serve);
        pointUpdate(id);
    }

}
