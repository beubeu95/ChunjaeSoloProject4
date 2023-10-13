package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewMapperImpl implements ReviewMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Review> reviewList(int lno) throws Exception {
        return sqlSession.selectList("review.reviewList", lno);
    }
}
