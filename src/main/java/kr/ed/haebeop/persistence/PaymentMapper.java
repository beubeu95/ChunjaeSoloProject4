package kr.ed.haebeop.persistence;
import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
public interface PaymentMapper {

    public Payment getPayment(String id, int lno) throws Exception;
    public int getCount(int lno) throws Exception;
    public int paymentNo() throws Exception;
    public Lecture getLecture(int lno) throws Exception;
    public Book getBook(String bcode) throws Exception;
    public void pointUpdate(String id) throws Exception;
    public List<Delivery> deliveryList() throws Exception;
    public void deliveryInsert(Delivery delivery);
    public void paymentInsert(Payment payment);
    public void serveInsert(Serve serve);
    public void addPayment (Delivery delivery, Serve serve, String id) throws Exception;


}
