package com.biu.wiki.mapper;

import com.biu.wiki.domain.Ebook;
import com.biu.wiki.domain.EbookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EbookMapper {
    long countByExample(EbookExample example);

    int deleteByExample(EbookExample example);

    int insert(Ebook record);

    int insertSelective(Ebook record);

    List<Ebook> selectByExample(EbookExample example);

    int updateByExampleSelective(@Param("record") Ebook record, @Param("example") EbookExample example);

    int updateByExample(@Param("record") Ebook record, @Param("example") EbookExample example);

    int updateByPrimaryKeySelective(Ebook record);

    int updateByPrimaryKey(Ebook record);

    int deleteByPrimaryKey(Long id);
}