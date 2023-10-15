package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.Serve;
import kr.ed.haebeop.domain.Book;


public interface PaymentService {
    public int paymentInsert(Payment payment) throws Exception ;
    public Payment getPayment(String id, int lno) throws Exception;
    public boolean payCheck(String id, int lno) throws Exception;
    public int getCount(int lno) throws Exception;
    public Lecture getLecture(int lno) throws Exception;
    public Book getBook(String bcode) throws Exception;
    public void addPayment (Delivery delivery,Serve serve, String id) throws Exception;

}
