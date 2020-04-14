package com.change.achievement.serviceI.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.News;
import com.change.achievement.mapper.NewsMapper;
import com.change.achievement.serviceI.NewServiceI;

@Service
public class NewServiceImpl implements NewServiceI {

	@Autowired
	private NewsMapper newsMapper;
	
	/**
	 * 删除新闻
	 * @author change
	 * @param nid
	 * @return int
	 */
	@Override
	public int delById(Integer nid) {
		return newsMapper.delById(nid);
	}
	/**
	 * 增加新闻
	 * @author change
	 * @param News news
	 * @return int
	 */
	@Override
	public int addNews(News news) {
		return newsMapper.addNews(news);
	}
	/**
	 * 获取总条数
	 * @author change
	 * @param News news
	 * @return int
	 */
	@Override
	public int selectNewsCount() {
		return newsMapper.selectNewsCount();
	}
	/**
	 * 获取数据
	 * @author change
	 * @param List<news>
	 * @return int
	 */
	@Override
	public List<News> selectNews(int start, int size) {
		return newsMapper.selectNews(start, size);
	}
	/**
	 * 根据id查询
	 * @author change
	 * @param List<news>
	 * @return int
	 */
	@Override
	public News selById(Integer nid) {
		return newsMapper.selById(nid);
	}

}
