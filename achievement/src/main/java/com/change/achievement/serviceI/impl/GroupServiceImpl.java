package com.change.achievement.serviceI.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Group;
import com.change.achievement.entity.Teacher;
import com.change.achievement.mapper.GroupMapper;
import com.change.achievement.serviceI.GroupServiceI;

@Service
public class GroupServiceImpl implements GroupServiceI {

	@Autowired
	private GroupMapper groupMapper;
	
	/**
	 * 查询课题组成员（添加）
	 * @author change
	 * @param String msg
	 * @return List<Group>
	 */
	@Override
	public List<Map<String,Object>> selectGroupMenber(String msg) {
		return groupMapper.selectGroupMenber(msg);
	}
	/**
	 * 新增课题组成员
	 * @author change
	 * @param Group group
	 * @return int
	 */
	@Override
	public int addMember(Group group) {
		return groupMapper.addMember(group);
	}
	/**
	 * 查询分页总数据
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getAllPage() {
		return groupMapper.getAllPage();
	}
	/**
	 * 查询分页数据
	 * @author change
	 * @param int start, int size
	 * @return List<Group>
	 */
	@Override
	public List<Group> selectByPage(int start, int size) {
		return groupMapper.selectByPage(start, size); 
	}
	/**
	 * 条件查询分页总数据
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getSearchAllPage(String msg) {
		return groupMapper.getSearchAllPage(msg);
	}
	/**
	 * 条件查询分页数据
	 * @author change
	 * @param hashmap
	 * @return List<Group>
	 */
	@Override
	public List<Group> getSearchPage(HashMap map) {
		return groupMapper.getSearchPage(map);
	}
	/**
	 * 根据条件查询数据
	 * @author change
	 * @param String tid, String gname
	 * @return List<Group>
	 */
	@Override
	public List<Group> selectGroupByMeg(String tid, String gname) {
		return groupMapper.selectGroupByMeg(tid, gname);
	}
	/**
	 * 根据条件删除数据
	 * @author change
	 * @param String tid, String gname
	 * @return int
	 */
	@Override
	public int deleteByMsg(String tid, String gname) {
		return groupMapper.deleteByMsg(tid, gname);
	}
	/**
	 * 查询分页总数据(教师)
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getAllPageT(String tid) {
		return groupMapper.getAllPageT(tid);
	}
	/**
	 * 查询分页数据（教师）
	 * @author change
	 * @param int start, int size
	 * @return List<Group>
	 */
	@Override
	public List<Group> selectByPageT(HashMap hashmap) {
		return groupMapper.selectByPageT(hashmap);
	}
	/**
	 * 条件查询分页总数据（教师）
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getSearchAllPageT(String msg, String tid) {
		return groupMapper.getSearchAllPageT(msg, tid);
	}
	/**
	 * 条件查询分页数据（教师）
	 * @author change
	 * @param hashmap
	 * @return List<Group>
	 */
	@Override
	public List<Group> getSearchPageT(HashMap map) {
		return groupMapper.getSearchPageT(map);
	}
	/**
	 * 前台查询课题组全部信息
	 * @author change
	 * @param 
	 * @return List<Group>
	 */
	@Override
	public List<Map<String, Object>> selectFore(int start,int size) {
		return groupMapper.selectFore(start,size);
	}
	/**
	 * 前台查询课题组全部信息
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int selectForeSize() {
		return groupMapper.selectForeSize();
	}
	/**
	 * 根据课题名字查询详细信息  前台系统
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public List<Map<String, Object>> selectGroupByGname(String gname,String tname) {
		return groupMapper.selectGroupByGname(gname,tname);
	}

}
