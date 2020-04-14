package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;

import com.change.achievement.entity.Content;

public interface ContentServiceI {

	public int addContent(Content content);//增加成果信息
	
	public int getAllPage();//获取总条数
	
	public List<Content> selectPage(int start,int size);//获取分页后数据
	
	public Content selContentById(int tcoid);//id查询信息

	public int uptContent(Content content);//根据id修改成果内容
	
	public int delContentById(int tcoid);//根据id删除信息
	
	public int getSearchPage(HashMap hashMap);//获取条件查询总页数

	public List<Content> selectSearchPage(HashMap hashMap);//获取条件查询分页后数据
	
	public int getPageT(String tid);//获取总条数
	
	public List<Content> selectPageT(HashMap hashMap);//获取分页后数据

	public int getSearchPageT(HashMap hashMap);//获取条件查询总页数
    
	public List<Content> selectSearchPageT(HashMap hashMap);//获取条件查询分页后数据

	public int selectBy2IdCount(HashMap hashMap);//前台数据查询条数

	public List<Content> selectBy2Id(HashMap hashMap);//前台数据查询
	
	public int selectAllCount(HashMap hashMap);//前台查询全部条数
	
	public List<Content> selectAll(HashMap hashMap);//前台查询全部
}
