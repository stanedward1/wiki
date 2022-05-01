package com.biu.wiki.service;

import com.biu.wiki.domain.Ebook;
import com.biu.wiki.domain.EbookExample;
import com.biu.wiki.mapper.EbookMapper;
import com.biu.wiki.req.EbookReq;
import com.biu.wiki.resp.EbookResp;
import com.biu.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author longbiu
 */
@Service
public class EbookService {

    @Resource
    private EbookMapper ebookMapper;

    public List<EbookResp> list(EbookReq req) {
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        criteria.andNameLike("%" + req.getName() + "%");
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);
        return CopyUtil.copyList(ebookList, EbookResp.class);
    }
}
