package com.change.achievement.serviceI.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Research;
import com.change.achievement.mapper.ResearchMapper;
import com.change.achievement.serviceI.ResearchServiceI;

@Service
public class ResearchServiceImpl implements ResearchServiceI{

	@Autowired
	private ResearchMapper researchMapper;
	
	/**
	 * 增加研究方向
	 * @author change
	 * @param	Research
	 * @return
	 */
	@Override
	public int addResearch(Research research) {
		return researchMapper.addResearch(research);
	}
	/**
	 * 查询研究方向
	 * @author change
	 * @param	String tid
	 * @return
	 */
	@Override
	public List<Research> selectResearch(String tid) {
		return researchMapper.selectResearch(tid);
	}
	/**
	 * 删除研究方向
	 * @author change
	 * @param int rid
	 * @return
	 */
	@Override
	public int delResearch(Integer rid) {
		return researchMapper.delResearch(rid);
	}

}
