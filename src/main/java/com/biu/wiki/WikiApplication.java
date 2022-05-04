package com.biu.wiki;

import com.biu.wiki.config.CorsConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;

/**
 * @Class_name WikiApplication
 * @Description ……
 * @Author longbiu
 * @Date 5/4/2022 11:04 PM
 **/
@SpringBootApplication
@MapperScan(value = "com.biu.wiki.mapper")
public class WikiApplication {
    private static final Logger LOG = LoggerFactory.getLogger(WikiApplication.class);

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(WikiApplication.class);
        Environment env = app.run(args).getEnvironment();
        LOG.info("启动成功");
        LOG.info("地址：\thttp://127.0.0.1:{}", env.getProperty("server.port"));
    }
}
