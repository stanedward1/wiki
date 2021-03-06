package com.biu.wiki.controller;

import com.biu.wiki.req.EbookQueryReq;
import com.biu.wiki.req.EbookSaveReq;
import com.biu.wiki.resp.CommonResp;
import com.biu.wiki.resp.EbookQueryResp;
import com.biu.wiki.resp.PageResp;
import com.biu.wiki.service.EbookService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

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
    public CommonResp list(@Valid EbookQueryReq req) {
        CommonResp<PageResp<EbookQueryResp>> objectCommonResp = new CommonResp<>();
        PageResp<EbookQueryResp> list = ebookService.list(req);
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }

    @PostMapping("/save")
    public CommonResp save(@RequestBody @Valid EbookSaveReq req) {
        CommonResp resp = new CommonResp<>();
        ebookService.save(req);
        return resp;
    }

    @DeleteMapping("/delete/{id}")
    public CommonResp delete(@PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        ebookService.delete(id);
        return resp;
    }
}
