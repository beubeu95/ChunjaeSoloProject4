package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.persistence.FileInfoMapper;

import java.util.List;

public interface FileInfoService {
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception;
    public void fileInfoEdit(FileInfo dto) throws Exception;
    public List<FileInfo> fileInfoList(int articleno) throws Exception;
    public void fileInfoInsert(Fileboard fileboard) throws Exception;
    public void fileInfoDelete(int articleno) throws Exception;

    public List<FileInfo> fileInfoDetail2(int lno) throws Exception;
    public List<FileInfo> fileInfoList2(int lno) throws Exception;
    public void fileInfoInsert2(Lecture lecture) throws Exception;
    public void fileInfoDelete2(int lno) throws Exception;
}
