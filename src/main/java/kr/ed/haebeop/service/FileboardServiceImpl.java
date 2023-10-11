package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.persistence.FileboardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileboardServiceImpl implements FileboardService{

    @Autowired
    private FileboardMapper fileboardMapper;

    @Override
    public void writeArticle(Fileboard fileboardDto) throws Exception {
        fileboardMapper.writeArticle(fileboardDto);
    }

    @Override
    public void fileRegister(Fileboard fileboardDto) throws Exception {
        fileboardMapper.fileRegister(fileboardDto);
    }

    @Override
    public List<Fileboard> fileList() throws Exception {
        return fileboardMapper.fileList();
    }

    @Override
    public Fileboard fileDetail(int articleno) throws Exception {
        return fileboardMapper.fileDetail(articleno);
    }

    @Override
    public void fileboardDelete(int articleno) throws Exception {
        fileboardMapper.fileboardDelete(articleno);
    }

    @Override
    public void fileboardEdit(Fileboard dto) throws Exception {
        fileboardMapper.fileboardEdit(dto);
    }
}
