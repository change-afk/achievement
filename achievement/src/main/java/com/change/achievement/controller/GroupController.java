package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.change.achievement.entity.Group;
import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Teacher;
import com.change.achievement.serviceI.GroupServiceI;
import com.change.achievement.serviceI.TeacherServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupServiceI groupService;
	@Autowired
	private TeacherServiceI teacherService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 删除课题组成员
	 * @author change
	 * @param Teacher teacher
	 * @return
	 */
	@RequestMapping("/delGroup")
	public Map<String, Object> delGroup(@RequestParam("tid") String tid,@RequestParam("gname") String gname) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			groupService.deleteByMsg(tid, gname);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -2);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 根据课题名字查询详细信息  前台系统
	 * @author change
	 * @param String gname
	 * @return
	 */
	@RequestMapping("/selectGroupByGname")
	public Map<String, Object> selectGroupByGname(@RequestParam("gname") String gname,@RequestParam("tname") String tname) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			list = groupService.selectGroupByGname(gname,tname);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 根据条件查询
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/selectGroupByMeg")
	public Map<String, Object> selectGroupByMeg(@RequestParam("tid") String tid,@RequestParam("gname") String gname) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Group> list = new ArrayList<Group>();
		try {
			list = groupService.selectGroupByMeg(tid, gname);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 条件查询(教师)
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/selGroupT")
	public Map<String, Object> selGroupT(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Group> list = new ArrayList<Group>();
		PageBean page = new PageBean();
		int totalCount = groupService.getSearchAllPageT(msg,tid);
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
		list = groupService.getSearchPageT(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询全部课题信息分页(教师)
	 * @author change
	 * @param 
	 * @return 
	 */
	@RequestMapping("/selectGroupT")
	public Map<String, Object> selectGroupT(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Group> list = new ArrayList<Group>();
		PageBean page = new PageBean();
		int totalCount = groupService.getAllPageT(tid);
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("tid", tid);
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		list = groupService.selectByPageT(searchMap);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 条件查询
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/selGroup")
	public Map<String, Object> selGroup(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Group> list = new ArrayList<Group>();
		PageBean page = new PageBean();
		int totalCount = groupService.getSearchAllPage(msg);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = groupService.getSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
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
		int totalCount = groupService.getAllPage();
		map.put("num", totalCount);
		return map;
	}
	/**
	 * 查询全部课题信息分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectGroup")
	public Map<String, Object> selectGroup(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Group> list = new ArrayList<Group>();
		PageBean page = new PageBean();
		int totalCount = groupService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = groupService.selectByPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 添加课题组成员
	 * @author change
	 * @param Teacher teacher
	 * @return
	 */
	@RequestMapping("/addMember")
	public Map<String, Object> insertTeacher(Group group) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = new Teacher();
		teacher = teacherService.selectTeacherByTid(group.getTid());
		if(teacher==null) {
			map.put("flag", -2);
			return map;
		}
		try {
			groupService.addMember(group);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加查询课题组成员
	 * @author change
	 * @param String msg
	 * @return 
	 */
	@RequestMapping("/selectGroupMenber")
	public Map<String, Object> selectGroupMenber(@RequestParam("msg") String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = groupService.selectGroupMenber(msg);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
			return map;
		}
		map.put("flag", 1);
		map.put("list", list);
		return map;
	}
	/**
	 * 前台查询课题组全部信息
	 * @author change 
	 * @param String msg
	 * @return  
	 */
	@RequestMapping("/selectForFore")
	public Map<String, Object> selectForFore(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		PageBean page = new PageBean();
		int totalCount = groupService.selectForeSize();
		page = pageUtil.getPage9(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = groupService.selectFore(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
}
