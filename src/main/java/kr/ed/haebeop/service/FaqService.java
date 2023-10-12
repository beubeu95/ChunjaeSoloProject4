package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Faq;

import java.util.List;

public interface FaqService {
    public List<Faq> faqList() throws Exception;
    public Faq faqDetail(int fno) throws Exception;
    public void faqInsert(Faq faq) throws Exception;
    public void faqEdit(Faq faq) throws Exception;
    public void faqDelete(int fno) throws Exception;
}
