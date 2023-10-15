package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.domain.User;

import java.util.List;

public interface UserService {
    public List<User> userList() throws Exception;
    public List<Teacher> tList() throws Exception;
    public User getUser(String id);
    public List<Payment> mylectureList(String id) throws Exception;
    public boolean idCheck(String id);
    public void userInsert(User user);
    public boolean loginCheck(String id, String pw) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userEdit(User user) throws Exception;
    public void userDelete(String id) throws Exception;
    public void teacherDelete(String tcode) throws Exception;
}
