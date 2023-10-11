package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMapperImpl {

    @Autowired
    private SqlSession sqlSession;


    public User getUser(String id) {
        return sqlSession.selectOne("user.getUser", id);
    }


    public void userInsert(User user) {
        sqlSession.insert("user.userInsert", user);
    }


    public User loginCheck(String id) throws Exception {
        return sqlSession.selectOne("user.loginCheck", id);
    }


    public void updateVisited(String id) throws Exception {
        sqlSession.update("user.updateVisited", id);
    }


    public void userEdit(User user) throws Exception {
        sqlSession.update("user.userEdit", user);
    }


    public void userDelete(String id) throws Exception {
        sqlSession.delete("user.userDelete", id);
    }
}
