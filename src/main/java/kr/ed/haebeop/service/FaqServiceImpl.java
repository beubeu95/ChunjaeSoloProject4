package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.persistence.FaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqServiceImpl implements FaqService{

    @Autowired
    private FaqMapper faqMapper;

    @Override
    public List<Faq> faqList() throws Exception {
        return faqMapper.faqList();
    }

    @Override
    public Faq faqDetail(int fno) throws Exception {
        return faqMapper.faqDetail(fno);
    }

    @Override
    public void faqInsert(Faq faq) throws Exception {
        faqMapper.faqInsert(faq);
    }

    @Override
    public void faqEdit(Faq faq) throws Exception {
        faqMapper.faqEdit(faq);
    }

    @Override
    public void faqDelete(int fno) throws Exception {
        faqMapper.faqDelete(fno);
    }
}
