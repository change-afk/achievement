package com.change.achievement.serviceI;

import java.util.List;

import com.change.achievement.entity.Research;

public interface ResearchServiceI {
	
	public int delResearch(Integer rid);//删除研究方向
	
	public int addResearch(Research research);//增加研究方向
	
	public List<Research> selectResearch(String tid);//查询研究方向

}
