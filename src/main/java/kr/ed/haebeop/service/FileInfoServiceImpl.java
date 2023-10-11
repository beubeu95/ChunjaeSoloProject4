package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.persistence.FileInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfoServiceImpl implements FileInfoService{

    @Autowired
    private FileInfoMapper fileInfoMapper;

    @Override
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception {
        return fileInfoMapper.fileInfoDetail(articleno);
    }

    @Override
    public void fileInfoEdit(FileInfo dto) throws Exception {
        fileInfoMapper.fileInfoEdit(dto);
    }

    @Override
    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return fileInfoMapper.fileInfoList(articleno);
    }

    @Override
    public void fileInfoInsert(Fileboard fileboard) throws Exception {
        fileInfoMapper.fileInfoInsert(fileboard);
    }

    @Override
    public void fileInfoDelete(int articleno) throws Exception {
        fileInfoMapper.fileInfoDelete(articleno);
    }
}
