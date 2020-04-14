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
import com.change.achievement.serviceI.EducationServiceI;

@Controller
@RequestMapping("/education")
public class EducationController {

	@Autowired
	private EducationServiceI educationService;
	
	/**
	 * 查询教育经历
	 * @author change
	 * @param Education education
	 * @return
	 */
	@RequestMapping("/selectEducation")
	public Map<String, Object> selectEducation(@RequestParam("tid")String tid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Education> list = new ArrayList<Education>();
		try {
			list = educationService.selectEducation(tid);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加教育经历
	 * @author change
	 * @param Education education
	 * @return
	 */
	@RequestMapping("/addEducation")
	public Map<String, Object> addEducation(Education education){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			educationService.addEducation(education);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 删除教育经历
	 * @author change
	 * @param int eid
	 * @return
	 */
	@RequestMapping("/delEducation")
	public Map<String, Object> delEducation(@RequestParam("eid")int eid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			educationService.delducation(eid);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
}
