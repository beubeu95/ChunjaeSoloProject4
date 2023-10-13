package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public List<Review> reviewList(int lno) throws Exception;
}
