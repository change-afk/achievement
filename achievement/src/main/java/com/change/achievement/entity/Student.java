package com.change.achievement.entity;

import java.io.Serializable;

public class Student implements Serializable {
    private Integer sid;

    private String tid;

    private String sname;

    private String sex;

    private String sedu;

    private String simg;
    
    private String tname;

    private static final long serialVersionUID = 1L;

    public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

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

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getSedu() {
        return sedu;
    }

    public void setSedu(String sedu) {
        this.sedu = sedu == null ? null : sedu.trim();
    }

    public String getSimg() {
        return simg;
    }

    public void setSimg(String simg) {
        this.simg = simg == null ? null : simg.trim();
    }
}