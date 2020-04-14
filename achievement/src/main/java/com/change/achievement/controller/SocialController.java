package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.change.achievement.entity.Social;
import com.change.achievement.serviceI.SocialServiceI;

@Controller
@RequestMapping("social")
public class SocialController {

	@Autowired
	private SocialServiceI socialService;
	
	/**
	 * 查询社会兼职
	 * @author change
	 * @param Work work
	 * @return
	 */
	@RequestMapping("/selectSocial")
	public Map<String, Object> selectSocial(@RequestParam("tid")String tid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Social> list = new ArrayList<Social>();
		try {
			list = socialService.selectSocial(tid);
			map.put("list", list);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加社会兼职
	 * @author change
	 * @param Social social
	 * @return
	 */
	@RequestMapping("/addSocial")
	public Map<String, Object> addSocial(Social social){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			socialService.addSocial(social);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 删除社会兼职
	 * @author change
	 * @param int sid
	 * @return
	 */
	@RequestMapping("/delSocial")
	public Map<String, Object> delSocial(@RequestParam("sid")int sid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			socialService.delSocial(sid);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
}
