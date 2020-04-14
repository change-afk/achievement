package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Student;

public interface StudentMapper {
	
	int getSearchAllPage(String msg);//条件查询总页数
	
	List<Student>  getSearchPage(HashMap map);//获取条件查询分页数据
	
    int deleteById(Integer sid);//根据id删除信息

    int addStudent(Student student);//新增学生信息
    
	int getAllPage();//获取分页总条数
	
	List<Student> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据
	
    int insertSelective(Student record);

    Student selectStudentByTid(Integer sid);//id查询数据

    int uptStudentById(Student student);//根据id更新数据
    
    int getSearchAllPageT(@Param("msg")String msg,@Param("tid")String tid);//条件查询总页数(教师)
	
	List<Student> getSearchPageT(HashMap map);//获取条件查询分页数据(教师)
	
	int getAllPageT(String tid);//获取分页总条数(教师)
	
	List<Student> selectByPageT(HashMap map);//获取分页后的数据(教师)

	List<Student> selectByTid(String tid);//根据教师id查询学生信息

    int updateByPrimaryKeyWithBLOBs(Student record);

    int updateByPrimaryKey(Student record);
}