package com.change.achievement.serviceI.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Password;
import com.change.achievement.mapper.PasswordMapper;
import com.change.achievement.serviceI.PassServiceI;

@Service
public class PassServiceImpl implements PassServiceI {

	@Autowired
	private PasswordMapper passMapper;
	
	/**
	 * 登录验证
	 * @author change
	 * @param username,password
	 * @return password
	 */
	@Override
	public Password login(String username, String password) {
		Password pass = new Password();
		pass = passMapper.login(username, password);
		return pass;
	}
	/**
	 * 添加账号
	 * @author change
	 * @param username,password
	 * @return int
	 */
	@Override
	public int addPass(Password password) {
		return passMapper.addPass(password);
	}
	/**
	 * 重置密码
	 * @author change
	 * @param pid,password
	 * @return int
	 */
	@Override
	public int uptPassById(int pid, String password) {
		return passMapper.uptPassById(pid,password);
	}
	/**
	 * 删除账号
	 * @author change
	 * @param pid
	 * @return int
	 */
	@Override
	public int delPassById(int pid) {
		return passMapper.delPassById(pid);
	}
	/**
	 * 分页，获取总条数
	 * @author change
	 * @return int
	 */
	@Override
	public int getAllPage() {
		return passMapper.getPage();
	}
	/**
	 * 获取分页后数据
	 * @author change
	 * @param start,size
	 * @return List<Password>
	 */
	@Override
	public List<Password> selectPage(int start,int size) {
		List<Password> list = new ArrayList<Password>();
		list = passMapper.selectPage(start, size);
		return list;
	}
	/**
	 * 重置全部密码
	 * @author change
	 * @param password
	 * @return int
	 */
	@Override
	public int uptAllPass(String password) {
		return passMapper.uptAllPass(password);
	}
	/**
	 * 更改权限
	 * @author change
	 * @param pid,tpower
	 * @return int
	 */
	@Override
	public int changePower(int pid, String tpower) {
		return passMapper.changePower(pid,tpower);
	}
	/**
	 * 获取条件查询总条数
	 * @author change
	 * @param 
	 * @return int
	 */
	@Override
	public int getSearchAllPage(String msg) {
		return passMapper.getSearchAllPage(msg);
	}
	/**
	 * 获取条件查询后的分页数据
	 * @author change
	 * @param HashMap map
	 * @return List<Password>
	 */
	@Override
	public List<Password> getSearchPage(HashMap map) {
		return passMapper.getSearchPage(map);
	}
	/**
	 * 根据id查询数据
	 * @author change
	 * @param String tid
	 * @return Password
	 */
	@Override
	public Password selectByTid(String tid) {
		return passMapper.selectByTid(tid);
	}
	/**
	 * 修改密码
	 * @author change
	 * @param pid,tpower
	 * @return int
	 */
	@Override
	public int changepwd(String tid, String password) {
		return passMapper.changepwd(tid, password);
	}

}
