package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;

import com.change.achievement.entity.Teacher;

public interface TeacherServiceI {
	
	public int getSearchAllPage(String msg);//条件查询总页数
	
	public List<Teacher>  getSearchPage(HashMap map);//获取条件查询分页数据

	public int delTeacherById(String tid);//tid修改教师信息

	public int uptTeacher(Teacher teacher);//tid修改教师信息
	
	public Teacher selectTeacherByTid(String tid);//tid查询教师信息

	public int addTeacher(Teacher teacher);//添加教师信息
	
	public int getAllPage();//查询分页总条数
	
	public List<Teacher> selectByPage(int start,int size);//获取分页后数据
}
