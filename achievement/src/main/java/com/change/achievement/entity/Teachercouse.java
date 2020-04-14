package com.change.achievement.entity;

import java.io.Serializable;

public class Teachercouse implements Serializable {
    private Integer tcid;

    private String tid;

    private Integer cid;

    private static final long serialVersionUID = 1L;

    public Integer getTcid() {
        return tcid;
    }

    public void setTcid(Integer tcid) {
        this.tcid = tcid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}