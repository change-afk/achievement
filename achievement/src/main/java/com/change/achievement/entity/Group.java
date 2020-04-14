package com.change.achievement.entity;

import java.io.Serializable;

public class Group implements Serializable {
    private Integer gid;

    private String tid;

    private String gname;

    private String sid;
    
    private String tname;
    
    private String sname;
    
    private String sex;

    private String sedu;

    private static final long serialVersionUID = 1L;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSedu() {
		return sedu;
	}

	public void setSedu(String sedu) {
		this.sedu = sedu;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname == null ? null : gname.trim();
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
}