package kr.ed.haebeop.config;

import kr.ed.haebeop.persistence.TestMapper;
import kr.ed.haebeop.persistence.TestMapperImpl;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ApplicationConfig {


    @Bean
    public TestMapper testMapper() {return new TestMapperImpl(); }

    @Bean
    public TestService testService() { return new TestServiceImpl(); }

}
