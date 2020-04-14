package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.change.achievement.entity.Education;
import com.change.achievement.entity.Work;
import com.change.achievement.serviceI.WorkServiceI;

@Controller
@RequestMapping("/work")
public class WorkController {

	@Autowired
	private WorkServiceI workService;
	
	/**
	 * 查询工作经历
	 * @author change
	 * @param Work work
	 * @return
	 */
	@RequestMapping("/selectWork")
	public Map<String, Object> selectEducation(@RequestParam("tid")String tid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Work> list = new ArrayList<Work>();
		try {
			list = workService.selectWork(tid);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加工作经历
	 * @author change
	 * @param Work work
	 * @return
	 */
	@RequestMapping("/addWork")
	public Map<String, Object> addEducation(Work work){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			workService.addWork(work);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 删除工作经历
	 * @author change
	 * @param int wid
	 * @return
	 */
	@RequestMapping("/delWork")
	public Map<String, Object> delWork(@RequestParam("wid")int wid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			workService.delWork(wid);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
}
