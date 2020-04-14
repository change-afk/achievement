package com.change.achievement.mapper;

import java.util.List;

import com.change.achievement.entity.Education;

public interface EducationMapper {

    int addEducation(Education education);//添加教育经历

    List<Education> selectEducation(String tid);//查询教育经历

    int delEducation(Integer eid);//删除教育经历

    int insertSelective(Education record);

    Education selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Education record);

    int updateByPrimaryKey(Education record);
}