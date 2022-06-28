package com.biu.wiki.req;

/**
 * @author longbiu
 */
public class DocQueryReq extends PageReq {
    private Integer id;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "DocQueryReq{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}