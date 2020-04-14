package com.change.achievement.util;

import com.change.achievement.entity.PageBean;

public class PageUtil {

	/**
	 * 分页功能
	 * @author change
	 * @param int totalCount
	 * @return PageBean
	 */
	public PageBean getPage(int totalCount){
		PageBean page = new PageBean();
		double pageSize = 10;//每页显示的记录数
		int currPage = 0;//当前页数
		int totalPage = (int) Math.ceil(totalCount/pageSize);//总页数
		page.setTotalCount((int)totalCount);
		page.setTotalPage(totalPage);
		page.setPageSize((int)pageSize);
		page.setCurrPage(currPage);
		return page;
	}
	/**
	 * 分页功能
	 * @author change
	 * @param int totalCount
	 * @return PageBean
	 */
	public PageBean getPage9(int totalCount){
		PageBean page = new PageBean();
		double pageSize = 9;//每页显示的记录数
		int currPage = 0;//当前页数
		int totalPage = (int) Math.ceil(totalCount/pageSize);//总页数
		page.setTotalCount((int)totalCount);
		page.setTotalPage(totalPage);
		page.setPageSize((int)pageSize);
		page.setCurrPage(currPage);
		return page;
	}
	/**
	 * 分页功能
	 * @author change
	 * @param int totalCount
	 * @return PageBean
	 */
	public PageBean getPage12(int totalCount){
		PageBean page = new PageBean();
		double pageSize = 12;//每页显示的记录数
		int currPage = 0;//当前页数
		int totalPage = (int) Math.ceil(totalCount/pageSize);//总页数
		page.setTotalCount((int)totalCount);
		page.setTotalPage(totalPage);
		page.setPageSize((int)pageSize);
		page.setCurrPage(currPage);
		return page;
	}
}
