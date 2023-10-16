package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.PaymentVO;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface UserMapper {
    public List<User> userList () throws Exception;
    public User getUser(String id);
    public List<PaymentVO> mylectureList(String id) throws Exception;
    public void userInsert(User user);
    public User loginCheck(String id) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userEdit(User user) throws Exception;
    public void userDelete(String id) throws Exception;

}
