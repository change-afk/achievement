package com.change.achievement.serviceI.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Work;
import com.change.achievement.mapper.WorkMapper;
import com.change.achievement.serviceI.WorkServiceI;

@Service
public class WorkServiceImpl implements WorkServiceI {

	@Autowired
	private WorkMapper workmapper;

	/**
	 * 添加工作经历
	 * @author change
	 * @param Work work
	 * @return int
	 */
	@Override
	public int addWork(Work work) {
		return workmapper.addWork(work);
	}

	/**
	 * 查询工作经历
	 * @author change
	 * @param tid
	 * @return list
	 */
	@Override
	public List<Work> selectWork(String tid) {
		return workmapper.selectWork(tid);
	}
	/**
	 * 删除工作经历
	 * @author change
	 * @param int wid
	 * @return list
	 */
	@Override
	public int delWork(int wid) {
		return workmapper.delWork(wid);
	}

}
