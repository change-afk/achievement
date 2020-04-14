package com.change.achievement.serviceI.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Teachercouse;
import com.change.achievement.mapper.TeachercouseMapper;
import com.change.achievement.serviceI.TeacherCourseServiceI;

@Service
public class TeacherCourseServiceImpl implements TeacherCourseServiceI {

	@Autowired
	private TeachercouseMapper tcMapper;
	
	/**
	 * 查询分页后的数据
	 * @author change
	 * @param int start, int size
	 * @return
	 */
	@Override
	public List<Map<String, Object>> selectByPage(int start, int size) {
		return tcMapper.selectByPage(start, size);
	}
	/**
	 * 获取条件查询的总页数
	 * @author change
	 * @param String msg
	 * @return int 
	 */
	@Override
	public int getSearchAllPage(String msg) {
		return tcMapper.getSearchAllPage(msg);
	}
	/**
	 * 获取条件查询的数据
	 * @author change
	 * @param HashMap map
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getSearchPage(HashMap map) {
		return tcMapper.getSearchPage(map);
	}
	/**
	 * 根据id删除展示信息
	 * @author change
	 * @param String tid
	 * @return
	 */
	@Override
	public int delTC(String tid) {
		return tcMapper.delTC(tid);
	}
	/**
	 * 增加展示信息
	 * @author change
	 * @param Teachercouse tc
	 * @return
	 */
	@Override
	public int addTC(Teachercouse tc) {
		return tcMapper.addTC(tc);
	}
	/**
	 * 查询分页后的数据(教师)
	 * @author change
	 * @param String tid
	 * @return
	 */
	@Override
	public List<Map<String, Object>> selectByPageT(String tid) {
		return tcMapper.selectByPageT(tid);
	}

}
