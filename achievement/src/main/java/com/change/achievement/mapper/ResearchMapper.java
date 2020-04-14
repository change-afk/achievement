package com.change.achievement.mapper;

import java.util.List;

import com.change.achievement.entity.Research;

public interface ResearchMapper {
	
    int delResearch(Integer rid);//删除研究方向

    int addResearch(Research record);//增加研究方向

    int insertSelective(Research record);

    List<Research> selectResearch(String tid);//查询研究方向

    int updateByPrimaryKeySelective(Research record);

    int updateByPrimaryKey(Research record);
}