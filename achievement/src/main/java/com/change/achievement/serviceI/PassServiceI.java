package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;

import com.change.achievement.entity.Password;


public interface PassServiceI {

	public int getAllPage();//获取总条数
	
	public Password login(String username,String password);//登录验证
	
	Password selectByTid(String tid);//根据id查询数据
	
	public int addPass(Password password);//添加账号
	
	public int changePower(int pid,String tpower);//修改权限

	public int changepwd(String tid,String password);//修改密码
	
	public int uptPassById(int pid,String password);//重置密码
	
	public int uptAllPass(String password);//重置全部密码
	
	public int delPassById(int pid);//删除密码
	
	public List<Password> selectPage(int start,int size);//获取分页后数据

	public int getSearchAllPage(String msg);//条件查询总页数
	
	public List<Password>  getSearchPage(HashMap map);//获取条件查询分页数据
}
