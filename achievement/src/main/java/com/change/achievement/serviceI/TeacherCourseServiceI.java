package com.change.achievement.serviceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.change.achievement.entity.Teacher;
import com.change.achievement.entity.Teachercouse;

public interface TeacherCourseServiceI {
	
	public int getSearchAllPage(String msg);//条件查询总页数
	
	public List<Map<String,Object>>  getSearchPage(HashMap map);//获取条件查询分页数据
	
	public List<Map<String,Object>> selectByPage(@Param("start")int start,@Param("size")int size);//获取分页后的数据
	
	public int delTC(String tid);//根据id删除全部教师展示
	
	public int addTC(Teachercouse tc);//插入展示信息
	
	public List<Map<String,Object>> selectByPageT(String tid);//获取分页后的数据(教师)
}
