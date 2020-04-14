package com.change.achievement.serviceI.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Student;
import com.change.achievement.entity.Teacher;
import com.change.achievement.mapper.StudentMapper;
import com.change.achievement.serviceI.StudentServiceI;

@Service
public class StudentServiceImpl implements StudentServiceI {

	@Autowired
	private StudentMapper stuMapper;
	
	/**
	 * 增加学生信息
	 * @author change
	 * @param	Student student
	 * @return
	 */
	@Override
	public int addStudent(Student student) {
		return stuMapper.addStudent(student);
	}
	/**
	 * 获取分页全部条数
	 * @author change
	 * @param Teacher teacher
	 * @return 
	 */
	@Override
	public int getAllPage() {
		return stuMapper.getAllPage();
	}
	/**
	 * 获取分页后的数据
	 * @author change
	 * @param int start, int size
	 * @return List<Student>
	 */
	@Override
	public List<Student> selectByPage(int start, int size) {
		return stuMapper.selectByPage(start, size);
	}
	/**
	 * 根据id查询数据
	 * @author change
	 * @param Integer sid
	 * @return Student
	 */
	@Override
	public Student selectStudentByTid(Integer sid) {
		return stuMapper.selectStudentByTid(sid);
	}
	/**
	 * 根据id修改数据
	 * @author change
	 * @param Student student
	 * @return Student
	 */
	@Override
	public int uptStudentById(Student student) {
		return stuMapper.uptStudentById(student);
	}
	/**
	 * 根据id删除信息
	 * @author change
	 * @param int
	 * @return int
	 */
	@Override
	public int deleteById(Integer sid) {
		return stuMapper.deleteById(sid);
	}
	/**
	 * 条件查询总条数
	 * @author change
	 * @param	String msg
	 * @return
	 */
	@Override
	public int getSearchAllPage(String msg) {
		return stuMapper.getSearchAllPage(msg);
	}
	/**
	 * 条件查询分页数据
	 * @author change
	 * @param	String msg
	 * @return
	 */
	@Override
	public List<Student> getSearchPage(HashMap map) {
		return stuMapper.getSearchPage(map);
	}
	/**
	 * 条件查询总条数(教师)
	 * @author change
	 * @param	String msg, String tid
	 * @return
	 */
	@Override
	public int getSearchAllPageT(String msg, String tid) {
		return stuMapper.getSearchAllPageT(msg, tid);
	}
	/**
	 * 条件查询分页(教师)
	 * @author change
	 * @param	String msg, String tid
	 * @return
	 */
	@Override
	public List<Student> getSearchPageT(HashMap map) {
		return stuMapper.getSearchPageT(map);
	}
	/**
	 * 获取分页全部条数(教师)
	 * @author change
	 * @param Teacher teacher
	 * @return 
	 */
	@Override
	public int getAllPageT(String tid) {
		return stuMapper.getAllPageT(tid);
	}
	/**
	 * 获取分页(教师)
	 * @author change
	 * @param Teacher teacher
	 * @return 
	 */
	@Override
	public List<Student> selectByPageT(HashMap map) {
		return stuMapper.selectByPageT(map);
	}
	/**
	 * 根据教师id查询学生信息
	 * @author change
	 * @param String tid
	 * @return 
	 */
	@Override
	public List<Student> selectByTid(String tid) {
		return stuMapper.selectByTid(tid);
	}


}
