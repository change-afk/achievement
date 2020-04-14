package com.change.achievement.serviceI.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.change.achievement.entity.Teacher;
import com.change.achievement.mapper.TeacherMapper;
import com.change.achievement.serviceI.TeacherServiceI;

@Service
public class TeacherServiceImpl implements TeacherServiceI{

	@Autowired
	private TeacherMapper teacherMapper;

	/**
	 * 添加教师信息
	 * @author change
	 * @param Teacher teacher
	 * @return int
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insert(teacher);
	}
	/**
	 * 获取分页全部条数
	 * @author change
	 * @param Teacher teacher
	 * @return int
	 */
	@Override
	public int getAllPage() {
		return teacherMapper.getAllPage();
	}
	/**
	 * 获取分页后的数据
	 * @author change
	 * @param int start, int size
	 * @return List<Teacher>
	 */
	@Override
	public List<Teacher> selectByPage(int start, int size) {
		List<Teacher> list = new ArrayList<Teacher>();
		list = teacherMapper.selectByPage(start,size);
		return list;
	}
	/**
	 * 根据id查询教师信息
	 * @author change
	 * @param String tid
	 * @return Teacher teacher
	 */
	@Override
	public Teacher selectTeacherByTid(String tid) {
		return teacherMapper.selectTeacherByTid(tid);
	}
	/**
	 * 根据id修改教师信息
	 * @author change
	 * @param Teacher teacher
	 * @return Teacher teacher
	 */
	@Override
	public int uptTeacher(Teacher teacher) {
		return teacherMapper.uptTeacher(teacher);
	}
	/**
	 * 根据id删除教师信息
	 * @author change
	 * @param String tid
	 * @return int 
	 */
	@Override
	public int delTeacherById(String tid) {
		return teacherMapper.delTeacherById(tid);
	}
	/**
	 * 获取条件查询的总页数
	 * @author change
	 * @param String msg
	 * @return int 
	 */
	@Override
	public int getSearchAllPage(String msg) {
		return teacherMapper.getSearchAllPage(msg);
	}
	/**
	 * 获取条件查询的数据
	 * @author change
	 * @param HashMap map
	 * @return List<Teacher> 
	 */
	@Override
	public List<Teacher> getSearchPage(HashMap map) {
		return teacherMapper.getSearchPage(map);
	} 
	


}
