package kr.ed.haebeop.config;

import kr.ed.haebeop.persistence.*;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ApplicationConfig {

    @Bean
    public FileboardMapper fileboardMapper() {return new FileboardMapperImpl(); }

    @Bean
    public FileboardService fileboardService() { return new FileboardServiceImpl(); }

    @Bean
    public BoardMapper boardMapper() { return new BoardMapperImpl(); }

    @Bean
    public BoardService boardService() { return new BoardServiceImpl(); }

    @Bean
    public LectureMapper lectureMapper() { return new LectureMapperImpl(); }

    @Bean
    public LectureService lectureService() { return new LectureServiceImpl(); }

    @Bean
    public PaymentMapper paymentMapper() { return  new PaymentMapperImpl(); }

    @Bean
    public PaymentService paymentService() { return new PaymentServiceImpl(); }

    @Bean
    public CommentMapper commentMapper() { return new CommentMapperImpl(); }

    @Bean
    public CommentService commentService() { return new CommentServiceImpl(); }

}
