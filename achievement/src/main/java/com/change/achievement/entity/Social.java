package com.change.achievement.entity;

import java.io.Serializable;

public class Social implements Serializable {
    private Integer sid;

    private String tid;

    private String sdesc;

    private static final long serialVersionUID = 1L;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getSdesc() {
        return sdesc;
    }

    public void setSdesc(String sdesc) {
        this.sdesc = sdesc == null ? null : sdesc.trim();
    }
}