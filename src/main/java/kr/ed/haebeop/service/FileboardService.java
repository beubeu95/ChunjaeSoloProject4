package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Fileboard;

import java.util.List;

public interface FileboardService {
    public void writeArticle(Fileboard fileboardDto) throws Exception;
    public void fileRegister(Fileboard fileboardDto) throws Exception;
    public List<Fileboard> fileList() throws Exception;
    public Fileboard fileDetail(int articleno) throws Exception;
    public void fileboardDelete(int articleno) throws Exception;
    public void fileboardEdit(Fileboard dto) throws Exception;
}
