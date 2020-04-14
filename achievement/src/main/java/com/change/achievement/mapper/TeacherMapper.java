package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Teacher;

public interface TeacherMapper {
	
	int getSearchAllPage(String msg);//条件查询总页数
	
	List<Teacher>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	int delTeacherById(String tid);//根据id删除信息
	
	int uptTeacher(Teacher teacher);//tid修改教师信息
	
	Teacher selectTeacherByTid(String tid);//根据id查询教师信息
	
	int insert(Teacher record);//插入教师信息

	int getAllPage();//获取分页总条数
	
	List<Teacher> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据
}