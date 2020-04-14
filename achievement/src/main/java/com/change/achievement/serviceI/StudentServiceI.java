package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Student;

public interface StudentServiceI {

	public int addStudent(Student student);//新增学生信息
	
	public int getAllPage();//查询分页总条数
	
	public List<Student> selectByPage(int start,int size);//获取分页后数据
	
	public Student selectStudentByTid(Integer sid);//id查询数据
	
	public int uptStudentById(Student student);//根据id更新数据
	
	public int deleteById(Integer sid);//根据id删除信息
	
	public int getSearchAllPage(String msg);//条件查询总页数
	
	public List<Student>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	public int getSearchAllPageT(@Param("msg")String msg,@Param("tid")String tid);//条件查询总页数(教师)
	
	public List<Student> getSearchPageT(HashMap map);//获取条件查询分页数据(教师)
	
	public int getAllPageT(String tid);//获取分页总条数(教师) 
	
	public List<Student> selectByPageT(HashMap map);//获取分页后的数据(教师)
	
	public List<Student> selectByTid(String tid);//根据教师id查询学生信息
}
