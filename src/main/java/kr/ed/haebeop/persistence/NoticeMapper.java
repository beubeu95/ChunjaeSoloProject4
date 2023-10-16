package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
public interface NoticeMapper {
    public List<Notice> noticeList(Page page) throws Exception;
    public List<Notice> noticeListLimit() throws Exception;
    public int getCount(Page page) throws Exception;
    public Notice noticeDetail(int no) throws Exception;
    public void noticeInsert(Notice notice) throws Exception;
    public void noticeDelete(int no) throws Exception;
    public void noticeEdit(Notice notice) throws Exception;

}
