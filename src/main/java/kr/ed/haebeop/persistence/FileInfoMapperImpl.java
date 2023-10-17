package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.domain.Fileboard;
import kr.ed.haebeop.domain.Lecture;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileInfoMapperImpl implements FileInfoMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoDetail", articleno);
    }

    @Override
    public void fileInfoEdit(FileInfo dto) throws Exception {
        sqlSession.update("fileInfo.fileboardEdit", dto);
    }

    @Override
    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoList");
    }

    @Override
    public void fileInfoInsert(Fileboard fileboard) throws Exception {
        sqlSession.insert("fileInfo.fileInfoInsert", fileboard);
    }

    @Override
    public void fileInfoDelete(int articleno) throws Exception {
        sqlSession.update("fileInfo.fileInfoDelete", articleno);
    }


    @Override
    public List<FileInfo> fileInfoDetail2(int lno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoDetail2", lno);
    }

    @Override
    public List<FileInfo> fileInfoList2(int lno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoList2");
    }

    @Override
    public void fileInfoInsert2(Lecture lecture) throws Exception {
        sqlSession.insert("fileInfo.fileInfoInsert2", lecture);
    }

    @Override
    public void fileInfoDelete2(int lno) throws Exception {
        sqlSession.update("fileInfo.fileInfoDelete2", lno);
    }

}
