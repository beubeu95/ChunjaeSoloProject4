package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.persistence.NoticeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> noticeList(Page page) {
        return noticeMapper.noticeList(page);
    }

    @Override
    public int getCount(Page page) {
        return noticeMapper.getCount(page);
    }

    @Override
    public Notice noticeDetail(int no) {
        return noticeMapper.noticeDetail(no);
    }

    @Override
    public void noticeInsert(Notice notice) {
        noticeMapper.noticeInsert(notice);
    }

    @Override
    public void noticeDelete(int no) {
        noticeMapper.noticeDelete(no);
    }

    @Override
    public void noticeEdit(Notice notice) {
        noticeMapper.noticeEdit(notice);
    }

}
