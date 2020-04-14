package com.change.achievement.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Password;

public interface PasswordMapper {
	
	Password login(@Param("username")String username,@Param("password")String password);//登录验证

	Password selectByTid(String tid);//根据id查询数据
	
	int addPass(Password record);//添加账号
	
	int getPage();//获取总条数
	
	List<Password> selectPage(@Param("start")int start,@Param("size")int size);//获取分页后数据

	int changePower(@Param("pid")int pid, @Param("tpower")String tpower);//更改权限
    
	int uptPassById(@Param("pid")int pid, @Param("tpassword")String password);//重置密码
	
	int changepwd(@Param("tid")String tid, @Param("tpassword")String password);//重置密码

    int uptAllPass(String password);//重置全部密码

    int delPassById(int pid);//删除账号
	
    int getSearchAllPage(String msg);//获取条件查询总条数
    
    List<Password> getSearchPage(HashMap map);//获取条件查询后的分页数据
}