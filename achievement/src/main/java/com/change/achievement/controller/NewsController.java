package com.change.achievement.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.change.achievement.entity.Course;
import com.change.achievement.entity.News;
import com.change.achievement.entity.PageBean;
import com.change.achievement.serviceI.NewServiceI;
import com.change.achievement.util.PageUtil;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewServiceI newService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 查询全部新闻
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selById")
	public Map selById(@RequestParam("nid") int nid) {
		Map map = new HashMap();
		News news = new News();
		news = newService.selById(nid);
		map.put("news", news);
		return map;
	}
	/**
	 * 查询全部新闻
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectNews")
	public Map selectNews(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map map = new HashMap();
		List<News> list = new ArrayList<News>();
		PageBean page = new PageBean();
		int totalCount = newService.selectNewsCount();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = newService.selectNews(start, page.getPageSize());
		map.put("list", list);
		map.put("page", page);
		return map;
	}
	/**
	 * 新增新闻内容
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/addNews")
	@ResponseBody
	public Map addNews(News news) {
		Map map = new HashMap();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		news.setNtime(df.format(new Date()));
		int i = newService.addNews(news);
		map.put("flag", i);
		return map;
	}
	/**
	 * 删除展示信息列
	 * @author change
	 * @param cid
	 * @return
	 */
	@RequestMapping("/delNews")
	public Map delNews(@RequestParam("nid") int nid) {
		Map<String, Object> map = new HashMap();
		int i=0;
		i=newService.delById(nid);
		map.put("flag", i);
		return map;
	}
}
