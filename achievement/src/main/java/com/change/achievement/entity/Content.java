package com.change.achievement.entity;

import java.io.Serializable;

public class Content implements Serializable {
    private Integer tcoid;

    private String tcname;

    private Integer cid;

    private String cname;
    
    private String tname;
    
    private String tid;

    private String tcontent;
    
    private String creatime;

    private String comefrom;

    private String money;

    private String outschool;
    
    private String sendtime;

    private String sendname;

    private String sendtype;

    private String belongunit;

    private String belongtype;

    private String belongnum;

    private String belongtime;

    private static final long serialVersionUID = 1L;

    public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getSendname() {
		return sendname;
	}

	public void setSendname(String sendname) {
		this.sendname = sendname;
	}

	public String getSendtype() {
		return sendtype;
	}

	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}

	public String getBelongunit() {
		return belongunit;
	}

	public void setBelongunit(String belongunit) {
		this.belongunit = belongunit;
	}

	public String getBelongtype() {
		return belongtype;
	}

	public void setBelongtype(String belongtype) {
		this.belongtype = belongtype;
	}

	public String getBelongnum() {
		return belongnum;
	}

	public void setBelongnum(String belongnum) {
		this.belongnum = belongnum;
	}

	public String getBelongtime() {
		return belongtime;
	}

	public void setBelongtime(String belongtime) {
		this.belongtime = belongtime;
	}

	public String getCreatime() {
		return creatime;
	}

	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}

	public String getComefrom() {
		return comefrom;
	}

	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getOutschool() {
		return outschool;
	}

	public void setOutschool(String outschool) {
		this.outschool = outschool;
	}

	public Content() {
		super();
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getTcoid() {
        return tcoid;
    }

    public void setTcoid(Integer tcoid) {
        this.tcoid = tcoid;
    }

    public String getTcname() {
        return tcname;
    }

    public void setTcname(String tcname) {
        this.tcname = tcname == null ? null : tcname.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getTcontent() {
        return tcontent;
    }

    public void setTcontent(String tcontent) {
        this.tcontent = tcontent == null ? null : tcontent.trim();
    }
}