package com.change.achievement.serviceI;

import java.util.List;

import com.change.achievement.entity.Course;

public interface CourseServiceI {

	public int getAllCoursePage();//获取总条数
	
	public List<Course> selectCourse(int start,int size);//获取分页后数据

	public List<Course> selectAllCourse();//查询全部信息
	
	public int insertCourse(Course course);//增加展示信息列

	public int delPassById(int cid);//增加展示信息列
	
	public List<Course> selectByTid(String tid);//根据教师id查询全部展示信息列
}
