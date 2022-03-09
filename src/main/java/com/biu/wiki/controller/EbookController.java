package com.biu.wiki.controller;

import com.biu.wiki.domain.Ebook;
import com.biu.wiki.resp.CommonResp;
import com.biu.wiki.service.EbookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName EbookController
 * @Description TODO
 * @Author biu
 * @Date 2022/2/25 2:22 PM
 **/

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public CommonResp list() {
        CommonResp<List<Ebook>> objectCommonResp = new CommonResp<>();
        List<Ebook> list = ebookService.list();
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }
}
