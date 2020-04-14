package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Content;

public interface ContentMapper {

    int addContent(Content content);//增加成果信息
    
    int getPage();//获取总条数
	
	List<Content> selectPage(@Param("start")int start,@Param("size")int size);//获取分页后数据
	
	Content selContentById(Integer tcoid);//id查询信息
	
	int uptContent(Content content);//根据id修改信息

    int delContentById(Integer tcoid);//根据id删除信息
    
    int getSearchPage(HashMap hashMap);//获取条件查询总页数

    List<Content> selectSearchPage(HashMap hashMap);//获取条件查询分页后数据
    
    int getPageT(String tid);//获取总条数
	
	List<Content> selectPageT(HashMap hashMap);//获取分页后数据

    int getSearchPageT(HashMap hashMap);//获取条件查询总页数
    
    List<Content> selectSearchPageT(HashMap hashMap);//获取条件查询分页后数据
    
	int selectBy2IdCount(HashMap hashMap);//前台数据查询条数

	List<Content> selectBy2Id(HashMap hashMap);//前台数据查询
	
	int selectAllCount(HashMap hashMap);//前台查询全部条数
	
	List<Content> selectAll(HashMap hashMap);//前台查询全部
}