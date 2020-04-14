package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Student;
import com.change.achievement.entity.Teacher;
import com.change.achievement.serviceI.StudentServiceI;
import com.change.achievement.serviceI.TeacherServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentServiceI stuService;
	@Autowired
	private TeacherServiceI teacherService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 条件查询(教师)
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selStudentT")
	public Map<String, Object> selStudentT(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Student> list = new ArrayList<Student>();
		PageBean page = new PageBean();
		int totalCount = stuService.getSearchAllPageT(msg,tid);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("tid", tid);
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = stuService.getSearchPageT(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 根据id查询学生信息
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectStudentByTeacherTid")
	public Map<String, Object> selectStudentByTeacherTid(@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Student> list = new ArrayList<Student>();
		list = stuService.selectByTid(tid);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询数量
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectNum")
	public Map<String, Object> selectNum() {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCount = stuService.getAllPage();
		map.put("num", totalCount);
		return map;
	}
	/**
	 * 查询全部学生信息分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectStudentT")
	public Map<String, Object> selectStudentT(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Student> list = new ArrayList<Student>();
		PageBean page = new PageBean();
		int totalCount = stuService.getAllPageT(tid);
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("tid", tid);
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		list = stuService.selectByPageT(searchMap);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 条件查询
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selStudent")
	public Map<String, Object> selStudent(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Student> list = new ArrayList<Student>();
		PageBean page = new PageBean();
		int totalCount = stuService.getSearchAllPage(msg);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = stuService.getSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 删除学生信息（单个、批量）
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/delStudent")
	public Map<String, Object> delStudent(@RequestBody int[] array) {
		Map<String, Object> map = new HashMap();
		int i=0;
		try {
			for(int j=0;j<array.length;j++) {
				i=stuService.deleteById(array[j]);
			}
		} catch (Exception e) {
			i=-1;
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * id修改学生信息
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/uptStudent")
	public Map<String, Object> uptStudent(@RequestParam("jsonStr") String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		Student student = new Student();
		JSONObject jsonObject = JSONObject.parseObject(jsonStr);
		student = JSON.toJavaObject(jsonObject,Student.class );
		try {
			int i = stuService.uptStudentById(student);
			map.put("flag", i);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * id查询学生信息
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/selectStudentByTid")
	public Map<String, Object> selectStudentByTid(@RequestParam("sid") int sid) {
		Map<String, Object> map = new HashMap<String, Object>();
		Student student = new Student();
		try {
			student = stuService.selectStudentByTid(sid);
			if(student==null) {
				map.put("flag", -1);
				map.put("msg", "查询不到数据");
			}
			map.put("student", student);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 查询全部学生信息分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectStudent")
	public Map<String, Object> selectStudent(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Student> list = new ArrayList<Student>();
		PageBean page = new PageBean();
		int totalCount = stuService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = stuService.selectByPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 添加学生信息
	 * @author change
	 * @param Student student
	 * @return
	 */
	@RequestMapping("/addStudent")
	public Map<String, Object> addStudent(@RequestParam("jsonStr") String jsonStr){
		Map<String, Object> map = new HashMap<String, Object>();
		Student student = new Student();
		Teacher teacher = new Teacher();
		JSONObject jsonObject = JSONObject.parseObject(jsonStr);
		student = JSON.toJavaObject(jsonObject,Student.class );
		teacher = teacherService.selectTeacherByTid(student.getTid());
		try {
			if(teacher==null) {
				map.put("flag", -2);
				return map;
			}
			int i = stuService.addStudent(student);
			map.put("flag", i);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
}
