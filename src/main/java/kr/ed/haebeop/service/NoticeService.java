package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface NoticeService {
    public List<Notice> noticeList(Page page) throws Exception;
    public List<Notice> noticeListLimit() throws Exception;
    public int getCount(Page page) throws Exception;
    public Notice noticeDetail(int no) throws Exception;
    public void noticeInsert(Notice notice) throws Exception;
    public void noticeDelete(int no) throws Exception;
    public void noticeEdit(Notice notice) throws Exception;
}
