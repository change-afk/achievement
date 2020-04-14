package com.change.achievement.serviceI.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Education;
import com.change.achievement.mapper.EducationMapper;
import com.change.achievement.serviceI.EducationServiceI;

@Service
public class EducationServiceImpl implements EducationServiceI {
	
	@Autowired
	private EducationMapper eduMapper;

	/**
	 * 添加教育经历
	 * @author change
	 * @param Education education
	 * @return int
	 */
	@Override
	public int addEducation(Education education) {
		return eduMapper.addEducation(education);
	}
	/**
	 * 查询教育经历
	 * @author change
	 * @param tid
	 * @return list
	 */
	@Override
	public List<Education> selectEducation(String tid) {
		return eduMapper.selectEducation(tid);
	}
	/**
	 * 删除教育经历
	 * @author change
	 * @param int eid
	 * @return int
	 */
	@Override
	public int delducation(int eid) {
		return eduMapper.delEducation(eid);
	}

	



}
