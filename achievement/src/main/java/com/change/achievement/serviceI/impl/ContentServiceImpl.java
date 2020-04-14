package com.change.achievement.serviceI.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Content;
import com.change.achievement.mapper.ContentMapper;
import com.change.achievement.serviceI.ContentServiceI;

@Service
public class ContentServiceImpl implements ContentServiceI {

	@Autowired
	private ContentMapper contentMapper;
	
	/**
	 * 增加成果信息
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int addContent(Content content) {
		return contentMapper.addContent(content);
	}
	/**
	 * 获取总条数
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getAllPage() {
		return contentMapper.getPage();
	}
	/**
	 * 获取分页后数据
	 * @author change
	 * @param int start, int size
	 * @return List<Content>
	 */
	@Override
	public List<Content> selectPage(int start, int size) {
		return contentMapper.selectPage(start, size);
	}
	/**
	 * id查询信息
	 * @author change
	 * @param int tcoid
	 * @return Content
	 */
	@Override
	public Content selContentById(int tcoid) {
		return contentMapper.selContentById(tcoid);
	}
	/**
	 * 根据id修改成果内容
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int uptContent(Content content) {
		return contentMapper.uptContent(content);
	}
	/**
	 * 根据id删除成果内容
	 * @author change
	 * @param int tcoid
	 * @return int
	 */
	@Override
	public int delContentById(int tcoid) {
		return contentMapper.delContentById(tcoid);
	}
	/**
	 * 获取条件查询总页数
	 * @author change
	 * @param int tcoid
	 * @return int
	 */
	@Override
	public int getSearchPage(HashMap hashMap) {
		return contentMapper.getSearchPage(hashMap);
	}
	/**
	 * 获取条件查询分页后数据
	 * @author change
	 * @param int tcoid
	 * @return int
	 */
	@Override
	public List<Content> selectSearchPage(HashMap hashMap) {
		return contentMapper.selectSearchPage(hashMap);
	}
	/**
	 * 获取查询总页数（教师）
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int getPageT(String tid) {
		return contentMapper.getPageT(tid);
	}
	/**
	 * 获取查询分页数据（教师）
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public List<Content> selectPageT(HashMap hashMap) {
		return contentMapper.selectPageT(hashMap);
	}
	/**
	 * 条件查询总页数（教师）
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int getSearchPageT(HashMap hashMap) {
		return contentMapper.getSearchPageT(hashMap);
	}
	/**
	 * 条件查询内容（教师）
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public List<Content> selectSearchPageT(HashMap hashMap) {
		return contentMapper.selectSearchPageT(hashMap);
	}
	/**
	 * 前台数据条数查询
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int selectBy2IdCount(HashMap hashMap) {
		return contentMapper.selectBy2IdCount(hashMap);
	}
	/**
	 * 前台数据查询
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public List<Content> selectBy2Id(HashMap hashMap) {
		return contentMapper.selectBy2Id(hashMap);
	}
	/**
	 * 前台查询全部条数
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public int selectAllCount(HashMap hashMap) {
		return contentMapper.selectAllCount(hashMap);
	}
	/**
	 * 前台查询全部
	 * @author change
	 * @param Content content
	 * @return int
	 */
	@Override
	public List<Content> selectAll(HashMap hashMap) {
		return contentMapper.selectAll(hashMap);
	}

}
