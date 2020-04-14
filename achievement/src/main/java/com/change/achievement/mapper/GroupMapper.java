package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Group;
import com.change.achievement.entity.Teacher;

public interface GroupMapper {
	
	List<Map<String,Object>> selectGroupByGname(@Param("gname")String gname,@Param("tname")String tname);//根据课题名字查询详细信息  前台系统

	List<Map<String,Object>> selectFore(@Param("start")int start,@Param("size")int size);//前台查询课题组全部信息

	int selectForeSize();//前台查询课题组全部信息

	List<Map<String,Object>> selectGroupMenber(String msg);//查找课题组成员
	
	int getAllPage();//获取分页总条数
	
	List<Group> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据
	
	int getSearchAllPage(String msg);//条件查询总页数
	
	List<Group>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	int getAllPageT(String tid);//获取分页总条数(教师)
	
	List<Group> selectByPageT(HashMap hashmap);//获取分页后的数据(教师)
	
	int getSearchAllPageT(@Param("msg") String msg,@Param("tid") String tid);//条件查询总页数(教师)
	
	List<Group>  getSearchPageT(HashMap map);//获取条件查询分页数据(教师)
	
	List<Group> selectGroupByMeg(@Param("tid")String tid,@Param("gname")String gname);//根据条件查询信息

	int deleteByMsg(@Param("tid")String tid,@Param("gname")String gname);//根据条件删除信息
	
    int deleteByPrimaryKey(Integer gid);

    int addMember(Group group);

    int insertSelective(Group record);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
}