package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.PaymentVO;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserMapperImpl implements UserMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<User> userList() { return sqlSession.selectList("user.userList"); }
    @Override
    public User getUser(String id) {
        return sqlSession.selectOne("user.getUser", id);
    }
    @Override
    public List<PaymentVO> mylectureList(String id) { return sqlSession.selectList("user.mylectureList", id); }
    @Override
    public void userInsert(User user) {
        sqlSession.insert("user.userInsert", user);
    }
    @Override
    public User loginCheck(String id) throws Exception { return sqlSession.selectOne("user.loginCheck", id); }
    @Override
    public void updateVisited(String id) throws Exception { sqlSession.update("user.updateVisited", id); }
    @Override
    public void userEdit(User user) throws Exception { sqlSession.update("user.userEdit", user); }
    @Override
    public void userDelete(String id) throws Exception { sqlSession.delete("user.userDelete", id); }

}
