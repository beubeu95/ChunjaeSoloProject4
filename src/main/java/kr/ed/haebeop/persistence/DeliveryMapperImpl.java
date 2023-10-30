package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DeliveryMapperImpl implements DeliveryMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<DeliveryVO> deliveryList() throws Exception {
        return sqlSession.selectList("delivery.deliveryList");
    }

    @Override
    public DeliveryVO getdelivery(int dno) throws Exception {
        return sqlSession.selectOne("delivery.deliveryDetail" , dno);
    }

    @Override
    public void deliveryUpdate(Delivery delivery) throws Exception {
        sqlSession.update("delivery.deliveryUpdate", delivery);
    }

    @Override
    public DeliveryVO myDeliveryDetail(int dno) throws Exception {
        return sqlSession.selectOne("delivery.myDeliveryDetail", dno);
    }
}
