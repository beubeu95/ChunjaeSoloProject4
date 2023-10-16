package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;
import kr.ed.haebeop.persistence.DeliveryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeliveryServiceImpl implements DeliveryService{

    @Autowired
    private DeliveryMapper deliveryMapper;

    @Override
    public List<DeliveryVO> deliveryList() throws Exception {
        return deliveryMapper.deliveryList();
    }

    @Override
    public DeliveryVO getdelivery(int dno) throws Exception {
        return deliveryMapper.getdelivery(dno);
    }

    @Override
    public void deliveryUpdate(Delivery delivery) throws Exception {
        deliveryMapper.deliveryUpdate(delivery);
    }
}
