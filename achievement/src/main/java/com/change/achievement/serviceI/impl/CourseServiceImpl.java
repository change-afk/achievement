package com.change.achievement.serviceI.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Course;
import com.change.achievement.mapper.CourseMapper;
import com.change.achievement.serviceI.CourseServiceI;

@Service
public class CourseServiceImpl implements CourseServiceI {
	
	@Autowired
	private CourseMapper courseMapper;
	
	/**
	 * 分页，获取总条数
	 * @author change
	 * @return int
	 */
	@Override
	public int getAllCoursePage() {
		return courseMapper.getAllCoursePage();
	}
	/**
	 * 获取分页后数据
	 * @author change
	 * @param start,size
	 * @return List<Password>
	 */
	@Override
	public List<Course> selectCourse(int start, int size) {
		List<Course> list = new ArrayList<Course>();
		list = courseMapper.selectCourseByPage(start, size);
		return list;
	}
	/**
	 * 增加展示信息列
	 * @author change
	 * @param course
	 * @return int
	 */
	@Override
	public int insertCourse(Course course) {
		return courseMapper.insertCourse(course);
	}
	/**
	 * 删除展示信息列
	 * @author change
	 * @param cid
	 * @return int
	 */
	@Override
	public int delPassById(int cid) {
		return courseMapper.delPassById(cid);
	}
	/**
	 * 查询全部信息
	 * @author change
	 * @param cid
	 * @return int
	 */
	@Override
	public List<Course> selectAllCourse() {
		return courseMapper.selectAllCourse();
	}
	/**
	 * 根据教师id查询全部展示信息列
	 * @author change
	 * @param cid
	 * @return int
	 */
	@Override
	public List<Course> selectByTid(String tid) {
		return courseMapper.selectByTid(tid);
	}
}
