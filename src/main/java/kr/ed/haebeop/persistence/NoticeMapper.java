package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    public List<Notice> noticeList(Page page);
    public int getCount(Page page);
    public Notice noticeDetail(int no);
    public void noticeInsert(Notice notice);
    public void noticeDelete(int no);
    public void noticeEdit(Notice notice);

}
