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
import org.springframework.web.bind.annotation.ResponseBody;

import com.change.achievement.entity.Course;
import com.change.achievement.entity.PageBean;
import com.change.achievement.serviceI.CourseServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseServiceI courseService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 删除展示信息列
	 * @author change
	 * @param cid
	 * @return
	 */
	@RequestMapping("/delCourse")
	public Map delCourse(@RequestParam("cid") int cid) {
		Map<String, Object> map = new HashMap();
		int i=0;
		i=courseService.delPassById(cid);
		map.put("flag", i);
		return map;
	}
	/**
	 * 增加展示信息列
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/addCourse")
	@ResponseBody
	public Map addCourse(Course course) {
		Map map = new HashMap();
		int i = courseService.insertCourse(course);
		map.put("flag", i);
		return map;
	}
	/**
	 * 查询数量
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectNum")
	public Map selectNum() {
		Map map = new HashMap();
		int totalCount = courseService.getAllCoursePage();
		map.put("num", totalCount);
		return map;
	}
	/**
	 * 查询全部展示信息列
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectCourse")
	public Map selectCourse(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map map = new HashMap();
		List<Course> list = new ArrayList<Course>();
		PageBean page = new PageBean();
		int totalCount = courseService.getAllCoursePage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = courseService.selectCourse(start, page.getPageSize());
		map.put("list", list);
		map.put("page", page);
		return map;
	}
	/**
	 * 根据id查询全部展示信息列
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectCourseById")
	public Map selectCourseById(@RequestParam("tid") String tid) {
		Map map = new HashMap();
		List<Course> list = new ArrayList<Course>();
		list = courseService.selectByTid(tid);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询全部展示信息列不分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectAllCourse")
	public Map selectAllCourse() {
		Map map = new HashMap();
		List<Course> list = new ArrayList<Course>();
		list = courseService.selectAllCourse();
		map.put("list", list);
		return map;
	}
	
}
