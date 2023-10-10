package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.persistence.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {

   @Autowired
   private TestMapper testMapper;

    @Override
    public List<Test> testList() throws Exception {
        return testMapper.testList();
    }
}
