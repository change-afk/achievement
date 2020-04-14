package com.change.achievement.serviceI;

import java.util.List;

import com.change.achievement.entity.Education;

public interface EducationServiceI {

	public int addEducation(Education education);//添加账号
	
	public List<Education> selectEducation(String tid);//查询教育经历
	
	public int delducation(int eid);//删除教育经历
}
