package com.change.achievement.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Course;

public interface CourseMapper {
	
	int insertCourse(Course course);//增加展示信息列
	
	int getAllCoursePage();//获取总条数
	
	List<Course> selectCourseByPage(@Param("start")int start,@Param("size")int size);//获取分页后数据
	
	int delPassById(Integer cid);//删除展示信息列
	
	public List<Course> selectAllCourse();//查询全部数据

	public List<Course> selectByTid(String tid);//根据教师id查询全部展示信息列
	/*未使用*/
    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}