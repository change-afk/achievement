package com.change.achievement.serviceI;

import java.util.List;

import com.change.achievement.entity.Social;

public interface SocialServiceI {

	public int delSocial(int sid);//删除社会兼职
	
	public int addSocial(Social social);//增加社会兼职
	
	public List<Social> selectSocial(String tid);//查询社会兼职
}
