package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;

import java.util.List;

public interface DeliveryService {

    public List<DeliveryVO> deliveryList() throws Exception;
    public DeliveryVO getdelivery(int dno) throws Exception;
    public void deliveryUpdate (Delivery delivery) throws Exception;
}
