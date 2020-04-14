package com.change.achievement.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.News;

public interface NewsMapper {
    
	int delById(Integer nid);//根据id删除信息

    int addNews(News news);//增加新闻信息
    
    int selectNewsCount();//获取分页总条数
	
	List<News> selectNews(@Param("start")int start,@Param("size")int size);//获取分页后的数据

	News selById(Integer nid);//根据id查询
	
    int insertSelective(News record);

    News selectByPrimaryKey(Integer nid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}