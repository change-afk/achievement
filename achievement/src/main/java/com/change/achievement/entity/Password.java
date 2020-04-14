package com.change.achievement.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;

public class Password implements Serializable {
    private Integer pid;

    private String tid;

    private String tpassword;

    private String tpower;
    
    private String tname;

    private static final long serialVersionUID = 1L;

    public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getTpassword() {
        return tpassword;
    }

    public void setTpassword(String tpassword) {
        this.tpassword = tpassword == null ? null : tpassword.trim();
    }

    public String getTpower() {
        return tpower;
    }

    public void setTpower(String tpower) {
        this.tpower = tpower == null ? null : tpower.trim();
    }

	public Password(String tid, String tpassword, String tpower) {
		super();
		this.tid = tid;
		this.tpassword = tpassword;
		this.tpower = tpower;
	}

	public Password(String tid, String tpassword) {
		super();
		this.tid = tid;
		this.tpassword = tpassword;
	}

	public Password() {
		super();
	}
    
}