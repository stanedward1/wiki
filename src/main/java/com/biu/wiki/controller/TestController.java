package com.biu.wiki.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName TestController
 * @Description TODO
 * @Author biu
 * @Date 2022/2/25 2:22 PM
 **/

@RestController
public class TestController {

    @RequestMapping("/")
    public String home() {
        return "Welcome";
    }

    @RequestMapping("/hello")
    public String hello() {
        return "Hello World";
    }
}
