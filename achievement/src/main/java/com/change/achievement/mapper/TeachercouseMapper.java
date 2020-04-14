package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Teachercouse;

public interface TeachercouseMapper {
	
	List<Map<String,Object>> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据

	List<Map<String,Object>> selectByPageT(String tid);//获取分页后的数据(教师)
    
	int getSearchAllPage(String msg);//条件查询总页数
	
	List<Map<String,Object>>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	int delTC(String cid);//根据教师id删除展示信息

    int addTC(Teachercouse record);//增加展示信息

    int insertSelective(Teachercouse record);

    Teachercouse selectByPrimaryKey(Integer tcid);

    int updateByPrimaryKeySelective(Teachercouse record);

    int updateByPrimaryKey(Teachercouse record);
}