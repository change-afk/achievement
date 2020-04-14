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

import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Teacher;
import com.change.achievement.entity.Teachercouse;
import com.change.achievement.serviceI.TeacherCourseServiceI;
import com.change.achievement.serviceI.TeacherServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/TeacherCourse")
public class TeacherCourseController {

	@Autowired
	private TeacherServiceI teacherService;
	@Autowired
	private TeacherCourseServiceI tcService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 添加展示信息
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/addTC")
	public Map<String, Object> addTC(@RequestBody String[] array) {
		Map<String, Object> map = new HashMap();
		int i=0;String tid=array[0];
		Teachercouse tc = new Teachercouse();
		tc.setTid(tid);
		try {
			tcService.delTC(tid);
			for(int j=1;j<array.length;j++) {
				tc.setCid(Integer.parseInt(array[j]));
				i=tcService.addTC(tc);
			}
		} catch (Exception e) {
			i=-1;
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * 条件查询
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/selectSearchTC")
	public Map<String, Object> selectSearchTC(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		PageBean page = new PageBean();
		int totalCount = tcService.getSearchAllPage(msg);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = tcService.getSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询全部信息分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectTC")
	public Map<String, Object> selectTc(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		PageBean page = new PageBean();
		int totalCount = teacherService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = tcService.selectByPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询全部信息分页(教师)
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectTCT")
	public Map<String, Object> selectTcT(@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = tcService.selectByPageT(tid);
		map.put("list", list);
		return map;
	}

}
