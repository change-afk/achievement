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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.change.achievement.entity.Content;
import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Teacher;
import com.change.achievement.serviceI.ContentServiceI;
import com.change.achievement.serviceI.TeacherServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/content")
public class ContentController {

	@Autowired
	private ContentServiceI contentService;
	@Autowired
	private TeacherServiceI teacherService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 根据id删除成果内容
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delContent")
	public Map<String, Object> uptContent(@RequestBody int[] array) {
		Map<String, Object> map = new HashMap<String, Object>();
		int i=0;
		try {
			for(int j=0;j<array.length;j++) {
				i=contentService.delContentById(array[j]);
			}
		} catch (Exception e) {
			i=-1;
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * 根据id修改成果内容
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/uptContent")
	public Map<String, Object> uptContent(Content content) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int i = contentService.uptContent(content);
			map.put("flag", i);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * id查询数据
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selContentById")
	public Map<String, Object> selContentById(@RequestParam("tcoid") int tcoid) {
		Map<String, Object> map = new HashMap<String, Object>();
		Content content = new Content();
		try {
			content = contentService.selContentById(tcoid);
			if(content==null) {
				map.put("flag", -1);
				map.put("msg", "查询不到数据");
				return map;
			}
			map.put("content", content);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 前台查询全部
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectAll")
	public Map<String, Object> selectAll(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("cid") int cid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Content> list = new ArrayList<Content>();
		PageBean page = new PageBean();
		searchMap.put("cid", cid);
		int totalCount = contentService.selectAllCount(searchMap);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		list = contentService.selectAll(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 前台数据查询
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectBy2Id")
	public Map<String, Object> selectBy2Id(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("cid") int cid,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Content> list = new ArrayList<Content>();
		PageBean page = new PageBean();
		searchMap.put("tid", tid);
		searchMap.put("cid", cid);
		int totalCount = contentService.selectBy2IdCount(searchMap);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		list = contentService.selectBy2Id(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 分页查询全部数据
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectContent")
	public Map<String, Object> selectContent(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap();
		List<Content> list = new ArrayList<Content>();
		PageBean page = new PageBean();
		int totalCount = contentService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = contentService.selectPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 条件查询全部数据
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/search")
	public Map<String, Object> search(@RequestParam(defaultValue = "1") int currPage,@RequestParam(defaultValue = "1") int toPage,
			@RequestParam("tid") String tid,@RequestParam("tname") String tname,@RequestParam("cid") int cid) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Content> list = new ArrayList<Content>();
		PageBean page = new PageBean();
		searchMap.put("tid", tid);
		searchMap.put("tname", tname);
		searchMap.put("cid", cid);
		int totalCount = contentService.getSearchPage(searchMap);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		list = contentService.selectSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 分页查询全部数据(教师)
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectContentT")
	public Map<String, Object> selectContentT(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Content> list = new ArrayList<Content>();
		PageBean page = new PageBean();
		int totalCount = contentService.getPageT(tid);
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("tid", tid);
		list = contentService.selectPageT(searchMap);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 增加成果信息
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/addContent")
	@ResponseBody
	public Map addCourse(Content content) {
		Map map = new HashMap();
		Teacher teacher = new Teacher();
		teacher = teacherService.selectTeacherByTid(content.getTid());
		if(teacher!=null) {
			int i = contentService.addContent(content);
			map.put("flag", i);
		}else {
			map.put("flag", -2);//id不存在
		}
		return map;
	}
}
