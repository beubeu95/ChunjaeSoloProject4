package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Fileboard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface FileboardMapper {
    public void writeArticle(Fileboard fileboardDto) throws Exception;
    public void fileRegister(Fileboard fileboardDto) throws Exception;
    public List<Fileboard> fileList() throws Exception;
    public Fileboard fileDetail(int articleno) throws Exception;
    public void fileboardDelete(int articleno) throws Exception;
    public void fileboardEdit(Fileboard dto) throws Exception;



}
