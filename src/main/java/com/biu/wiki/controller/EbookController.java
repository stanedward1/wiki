package com.biu.wiki.controller;

import com.biu.wiki.req.EbookReq;
import com.biu.wiki.resp.CommonResp;
import com.biu.wiki.resp.EbookResp;
import com.biu.wiki.service.EbookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName EbookController
 * @Description ……
 * @Author biu
 * @Date 2022/2/25 2:22 PM
 **/

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public CommonResp list(EbookReq req) {
        CommonResp<List<EbookResp>> objectCommonResp = new CommonResp<>();
        List<EbookResp> list = ebookService.list(req);
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }
}
