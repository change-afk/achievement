package com.change.achievement.mapper;

import java.util.List;

import com.change.achievement.entity.Work;

public interface WorkMapper {
	
	int addWork(Work record);//添加工作经历

	List<Work> selectWork(String tid);//查询工作经历
	
	int delWork(Integer wid);//删除工作经历

    int insertSelective(Work record);

    Work selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Work record);

    int updateByPrimaryKey(Work record);
}