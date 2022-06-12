package com.biu.wiki.controller;

import com.biu.wiki.req.CategoryQueryReq;
import com.biu.wiki.req.CategorySaveReq;
import com.biu.wiki.resp.CommonResp;
import com.biu.wiki.resp.CategoryQueryResp;
import com.biu.wiki.resp.PageResp;
import com.biu.wiki.service.CategoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * @ClassName CategoryController
 * @Description ……
 * @Author biu
 * @Date 2022/2/25 2:22 PM
 **/

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    @GetMapping("/list")
    public CommonResp list(@Valid CategoryQueryReq req) {
        CommonResp<PageResp<CategoryQueryResp>> objectCommonResp = new CommonResp<>();
        PageResp<CategoryQueryResp> list = categoryService.list(req);
        objectCommonResp.setContent(list);
        return objectCommonResp;
    }

    @PostMapping("/save")
    public CommonResp save(@RequestBody @Valid CategorySaveReq req) {
        CommonResp resp = new CommonResp<>();
        categoryService.save(req);
        return resp;
    }

    @DeleteMapping("/delete/{id}")
    public CommonResp delete(@PathVariable Long id) {
        CommonResp resp = new CommonResp<>();
        categoryService.delete(id);
        return resp;
    }
}
