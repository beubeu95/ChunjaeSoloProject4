package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;

import java.util.List;


public interface PaymentService {
    public int paymentInsert(Payment payment) throws Exception ;
    public Payment getPayment(String id, int lno) throws Exception;
    public boolean payCheck(String id, int lno) throws Exception;
    public int getCount(int lno) throws Exception;
    public Lecture getLecture(int lno) throws Exception;
    public Book getBook(String bcode) throws Exception;
    public void addPayment (Delivery delivery,Serve serve,int pt, String id) throws Exception;
    public List<Delivery> deliveryList() throws Exception;
    public void deletePayment (int pno, String id, int sno) throws Exception;
    public void pointUpdate(int pt, String id) throws Exception;

    public Payment paymentDetail(String id, int lno) throws Exception;
    public PaymentVO myPaymentDetail(int pno) throws Exception;
}
