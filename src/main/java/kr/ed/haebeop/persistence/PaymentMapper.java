package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;

public interface PaymentMapper {
    public Payment getPayment(String id, int lno) throws Exception;
    public int getCount(int lno) throws Exception;
    public Lecture getLecture(int lno) throws Exception;
    public Book getBook(String bcode) throws Exception;
    public void paymentInsert(Delivery delivery, Payment payment, Serve serve) throws Exception;

}
