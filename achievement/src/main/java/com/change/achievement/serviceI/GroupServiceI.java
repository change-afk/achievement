package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Group;

public interface GroupServiceI {
	
	public List<Map<String,Object>> selectGroupByGname(String gname,String tname);//根据课题名字查询详细信息  前台系统

	public List<Map<String,Object>> selectGroupMenber(String msg);//查找课题组成员
	
	public int addMember(Group group);//新增课题组成员
	
	public int getAllPage();//获取分页总条数
	
	public List<Group> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据
	
	public int getSearchAllPage(String msg);//条件查询总页数
	
	public List<Group>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	public List<Group> selectGroupByMeg(String tid,String gname);//根据条件查询信息

	public int deleteByMsg(String tid,String gname);//根据条件删除信息
	
	public int getAllPageT(String tid);//获取分页总条数(教师)
	
	public List<Group> selectByPageT(HashMap hashmap);//获取分页后的数据(教师)
	
	public int getSearchAllPageT(@Param("msg") String msg,@Param("tid") String tid);//条件查询总页数(教师)
	
	public List<Group>  getSearchPageT(HashMap map);//获取条件查询分页数据(教师)
	
	public List<Map<String,Object>> selectFore(@Param("start")int start,@Param("size")int size);//前台查询课题组全部信息

	public int selectForeSize();//前台查询课题组全部信息
}
