package com.biu.wiki.controller;

import com.biu.wiki.req.DocQueryReq;
import com.biu.wiki.req.DocSaveReq;
import com.biu.wiki.resp.DocQueryResp;
import com.biu.wiki.resp.CommonResp;
import com.biu.wiki.resp.PageResp;
import com.biu.wiki.service.DocService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * @ClassName DocController
 * @Description ……
 * @Author biu
 * @Date 2022/2/25 2:22 PM
 **/

@RestController
@RequestMapping("/doc")
public class DocController {

    @Resource
    private DocService docService;

    @GetMapping("/all")
    public CommonResp all() {
        CommonResp<List<DocQueryResp>> objectCommonResp = new CommonResp<>();
        List<DocQueryResp> list = docService.all();
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }

    @GetMapping("/list")
    public CommonResp list(@Valid DocQueryReq req) {
        CommonResp<PageResp<DocQueryResp>> objectCommonResp = new CommonResp<>();
        PageResp<DocQueryResp> list = docService.list(req);
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }

    @PostMapping("/save")
    public CommonResp save(@RequestBody @Valid DocSaveReq req) {
        CommonResp resp = new CommonResp<>();
        docService.save(req);
        return resp;
    }

    @DeleteMapping("/delete/{id}")
    public CommonResp delete(@PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        docService.delete(id);
        return resp;
    }
}
