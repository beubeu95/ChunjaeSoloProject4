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
    public UserMapper userMapper() { return new UserMapperImpl(); }
    @Bean
    public UserService userService() { return new UserServiceImpl(); }
    @Bean
    public FileInfoMapper fileInfoMapper() {return new FileInfoMapperImpl(); }
    @Bean
    public FileInfoService fileInfoService() { return new FileInfoServiceImpl(); }
    @Bean
    public FileboardMapper fileboardMapper() {return new FileboardMapperImpl(); }
    @Bean
    public FileboardService fileboardService() { return new FileboardServiceImpl(); }
    @Bean
    public BoardMapper boardMapper() { return new BoardMapperImpl(); }
    @Bean
    public BoardService boardService() { return new BoardServiceImpl(); }
    @Bean
    public FaqMapper faqMapper() { return new FaqMapperImpl(); }
    @Bean
    public FaqService faqService() { return new FaqServiceImpl(); }
    @Bean
    public NoticeMapper noticeMapper() { return new NoticeMapperImpl(); }
    @Bean
    public NoticeService noticeService() { return new NoticeServiceImpl(); }
    @Bean
    public LectureMapper lectureMapper() { return new LectureMapperImpl(); }
    @Bean
    public LectureService lectureService() { return new LectureServiceImpl(); }
    @Bean
    public QnaMapper qnaMapper() { return  new QnaMapperImpl(); }
    @Bean
    public QnaService qnaService() { return new QnaServiceImpl(); }
    @Bean
    public PaymentMapper paymentMapper() { return  new PaymentMapperImpl(); }
    @Bean
    public PaymentService paymentService() { return new PaymentServiceImpl(); }
    @Bean
    public CommentMapper commentMapper() { return new CommentMapperImpl(); }
    @Bean
    public CommentService commentService() { return new CommentServiceImpl(); }
    @Bean
    public DeliveryMapper deliveryMapper() { return new DeliveryMapperImpl(); }
    @Bean
    public DeliveryService deliveryService() { return new DeliveryServiceImpl(); }

}
