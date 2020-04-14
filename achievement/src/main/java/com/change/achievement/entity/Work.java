package com.change.achievement.entity;

import java.io.Serializable;

public class Work implements Serializable {
    private Integer wid;

    private String tid;

    private String wtime;

    private String wdesc;

    private static final long serialVersionUID = 1L;

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getWtime() {
        return wtime;
    }

    public void setWtime(String wtime) {
        this.wtime = wtime == null ? null : wtime.trim();
    }

    public String getWdesc() {
        return wdesc;
    }

    public void setWdesc(String wdesc) {
        this.wdesc = wdesc == null ? null : wdesc.trim();
    }
}