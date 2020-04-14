package com.change.achievement.entity;

import java.io.Serializable;

public class Teacher implements Serializable {
    private String tid;

    private String tname;

    private String tsex;
    
    private String timg;

    private String telephone;

    private String tprofession;

    private String tunit;

    private String tintime;

    private String tdegree;

    private String tmajor;

    private String tschool;

    private String tmail;

    private String tplace;

    private String tpersonal;

    private String tgroup;

    private static final long serialVersionUID = 1L;

    public String getTimg() {
		return timg;
	}

	public void setTimg(String simg) {
		this.timg = simg;
	}

	public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex == null ? null : tsex.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getTprofession() {
        return tprofession;
    }

    public void setTprofession(String tprofession) {
        this.tprofession = tprofession == null ? null : tprofession.trim();
    }

    public String getTunit() {
        return tunit;
    }

    public void setTunit(String tunit) {
        this.tunit = tunit == null ? null : tunit.trim();
    }

    public String getTintime() {
        return tintime;
    }

    public void setTintime(String tintime) {
        this.tintime = tintime == null ? null : tintime.trim();
    }

    public String getTdegree() {
        return tdegree;
    }

    public void setTdegree(String tdegree) {
        this.tdegree = tdegree == null ? null : tdegree.trim();
    }

    public String getTmajor() {
        return tmajor;
    }

    public void setTmajor(String tmajor) {
        this.tmajor = tmajor == null ? null : tmajor.trim();
    }

    public String getTschool() {
        return tschool;
    }

    public void setTschool(String tschool) {
        this.tschool = tschool == null ? null : tschool.trim();
    }

    public String getTmail() {
        return tmail;
    }

    public void setTmail(String tmail) {
        this.tmail = tmail == null ? null : tmail.trim();
    }

    public String getTplace() {
        return tplace;
    }

    public void setTplace(String tplace) {
        this.tplace = tplace == null ? null : tplace.trim();
    }

    public String getTpersonal() {
        return tpersonal;
    }

    public void setTpersonal(String tpersonal) {
        this.tpersonal = tpersonal == null ? null : tpersonal.trim();
    }

    public String getTgroup() {
        return tgroup;
    }

    public void setTgroup(String tgroup) {
        this.tgroup = tgroup == null ? null : tgroup.trim();
    }
}