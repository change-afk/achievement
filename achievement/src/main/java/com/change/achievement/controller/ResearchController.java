package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.change.achievement.entity.Research;
import com.change.achievement.serviceI.ResearchServiceI;

@Controller
@RequestMapping("/research")
public class ResearchController {

	@Autowired
	private ResearchServiceI researchService;
	
	/**
	 * 查询研究方向
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/selectResearch")
	public Map<String, Object> selectResearch(@RequestParam("tid")String tid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Research> list = new ArrayList<Research>();
		try {
			list = researchService.selectResearch(tid);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加研究方向
	 * @author change
	 * @param Research research
	 * @return
	 */
	@RequestMapping("/addResearch")
	public Map<String, Object> addResearch(Research research){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			researchService.addResearch(research);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 删除研究方向
	 * @author change
	 * @param int rid
	 * @return
	 */
	@RequestMapping("/delResearch")
	public Map<String, Object> addResearch(@RequestParam("rid")int rid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			researchService.delResearch(rid);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
}
