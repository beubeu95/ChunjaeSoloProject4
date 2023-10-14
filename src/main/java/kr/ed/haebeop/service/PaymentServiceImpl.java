package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.persistence.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public Payment getPayment(String id, int lno) throws Exception {
        return paymentMapper.getPayment(id, lno);
    }

    @Override
    public boolean payCheck(String id, int lno) throws Exception {
        Payment payment = paymentMapper.getPayment(id, lno);

        if (payment!= null && payment.getLno() == lno) {
            return false;
        }

        return true;
    }

    @Override
    public int getCount(int lno) throws Exception {
        return paymentMapper.getCount(lno);
    }

    @Override
    public Lecture getLecture(int lno) throws Exception {
        return paymentMapper.getLecture(lno);
    }

    @Override
    public Book getBook(String bcode) throws Exception {
        return paymentMapper.getBook(bcode);
    }

    @Override
    public void paymentInsert(Delivery delivery, Payment payment, Serve serve) throws Exception {
        paymentMapper.paymentInsert(delivery, payment, serve);
    }
}
