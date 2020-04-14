package com.change.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Password;
import com.change.achievement.serviceI.PassServiceI;
import com.change.achievement.util.GetMD5;
import com.change.achievement.util.PageUtil;
import com.change.achievement.util.SysConstant;

@Controller
@RequestMapping("/password")
public class PassController {

	@Autowired
	private PassServiceI passService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 根据id查询数据
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/selectByTid")
	public Map selectByTid(@RequestParam("tid") String tid) {
		Map map = new HashMap();
		Password pass = new Password();
		try {
			pass = passService.selectByTid(tid);
			map.put("pass", pass);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 登录验证、添加账号
	 * @author change
	 * @param username,password
	 * @return
	 */
	@RequestMapping("/login")
	public Map login(@RequestParam("username") String username,@RequestParam("password") String password) {
		Map map = new HashMap();
		String pasMd5 = GetMD5.getMD5String(password);
		Password pass = new Password();
		pass = passService.login(username, pasMd5);
		if(pass==null) {
			map.put("flag",false);
			map.put("pass",pass);
			map.put("message", "账号或密码不正确！");
		}else {
			map.put("flag",true);
			map.put("pass", pass);
		}
		return map;
	}
	/**
	 * 修改密码
	 * @author change
	 * @param username,password
	 * @return
	 */
	@RequestMapping("/changepwd")
	public Map changepwd(@RequestParam("tid") String tid,@RequestParam("password") String password) {
		Map map = new HashMap();
		String pasMd5 = GetMD5.getMD5String(password);
		Password pass = new Password();
		try {
			int i = passService.changepwd(tid, pasMd5);
			map.put("flag", i);
		} catch (Exception e) {
			map.put("flag", -1);
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 添加账号
	 * @author change
	 * @param username,password
	 * @return
	 */
	@RequestMapping("/addPass")
	public Map<String, Object> addPass(Password password) {
		Map<String, Object> map = new HashMap();
		int i = 0;
		String passMd5 = GetMD5.getMD5String(password.getTpassword());//密码加密
		password.setTpassword(passMd5);
		try {
			i = passService.addPass(password);
		} catch (Exception e) {
			i = 2;//违反外键约束
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * 更改权限
	 * @author change
	 * @param pid,tpower
	 * @return
	 */
	@RequestMapping("/changePower")
	public Map<String, Object> changePower(@RequestParam("pid") int pid,@RequestParam("tpower")String tpower) {
		Map<String, Object> map = new HashMap();
		int i=0;
		i=passService.changePower(pid, tpower);
		map.put("flag", i);
		return map;
	}
	/**
	 * 重置单个密码
	 * @author change
	 * @param pid
	 * @return
	 */
	@RequestMapping("/resetPass")
	public Map<String, Object> uptPass(@RequestParam("pid") int pid) {
		Map<String, Object> map = new HashMap();
		String password = GetMD5.getMD5String(SysConstant.passWord_constant);
		int i=0;
		i=passService.uptPassById(pid, password);
		map.put("flag", i);
		return map;
	}
	/**
	 * 重置全部密码
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/resetAllPass")
	public Map<String, Object> uptPass() {
		Map<String, Object> map = new HashMap();
		String password = GetMD5.getMD5String(SysConstant.passWord_constant);
		int i=0;
		i=passService.uptAllPass(password);
		map.put("flag", i);
		return map;
	}
	/**
	 * 批量删除账号
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/delPass")
	public Map<String, Object> delPass(@RequestBody int[] array) {
		Map<String, Object> map = new HashMap();
		int i=0;
		try {
			for(int j=0;j<array.length;j++) {
				i=passService.delPassById(array[j]);
			}
		} catch (Exception e) {
			i=0;
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * 条件查询
	 * @author change
	 * @param 
	 * @return
	 */
	
	@RequestMapping("/search")
	public Map<String, Object> search(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg) {
		Map<String, Object> map = new HashMap();
		HashMap searchMap = new HashMap();
		List<Password> list = new ArrayList<Password>();
		PageBean page = new PageBean();
		int totalCount = passService.getSearchAllPage(msg);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = passService.getSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 分页查询全部数据
	 * @author change
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectPass")
	public Map<String, Object> selectPass(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap();
		List<Password> list = new ArrayList<Password>();
		PageBean page = new PageBean();
		int totalCount = passService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = passService.selectPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	
}
