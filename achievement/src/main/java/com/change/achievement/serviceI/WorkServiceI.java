package com.change.achievement.serviceI;

import java.util.List;

import com.change.achievement.entity.Work;

public interface WorkServiceI {

	public int addWork(Work work);//增加工作经历

	public List<Work> selectWork(String tid);//查询工作经历
	
	public int delWork(int wid);//删除工作经历
}
