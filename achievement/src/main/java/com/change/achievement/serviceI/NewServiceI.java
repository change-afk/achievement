package com.change.achievement.serviceI;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.News;

public interface NewServiceI {

	public int delById(Integer nid);//根据id删除信息

	public int addNews(News news);//增加新闻信息
    
	public int selectNewsCount();//获取分页总条数
	
	public List<News> selectNews(@Param("start")int start,@Param("size")int size);//获取分页后的数据
	
	public News selById(Integer nid);//根据id查询
}
