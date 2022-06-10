package com.biu.wiki.req;

/**
 * @author longbiu
 */
public class EbookReq extends PageReq {
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
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getClass().getSimpleName());
        stringBuilder.append(" [");
        stringBuilder.append("Hash = ").append(hashCode());
        stringBuilder.append(", id=").append(id);
        stringBuilder.append(", name=").append(name);
        return stringBuilder.toString();
    }
}