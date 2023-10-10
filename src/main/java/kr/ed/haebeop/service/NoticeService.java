package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface NoticeService {
    public List<Notice> noticeList(Page page);
    public int getCount(Page page);
    public Notice noticeDetail(int no);
    public void noticeInsert(Notice notice);
    public void noticeDelete(int no);
    public void noticeEdit(Notice notice);
}
