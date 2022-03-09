package com.biu.wiki.mapper;

import com.biu.wiki.domain.Demo;
import java.util.List;

public interface DemoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table demo
     *
     * @mbg.generated Tue Mar 08 18:39:25 CST 2022
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table demo
     *
     * @mbg.generated Tue Mar 08 18:39:25 CST 2022
     */
    int insert(Demo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table demo
     *
     * @mbg.generated Tue Mar 08 18:39:25 CST 2022
     */
    Demo selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table demo
     *
     * @mbg.generated Tue Mar 08 18:39:25 CST 2022
     */
    List<Demo> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table demo
     *
     * @mbg.generated Tue Mar 08 18:39:25 CST 2022
     */
    int updateByPrimaryKey(Demo record);
}