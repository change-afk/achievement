package com.change.achievement.serviceI.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.change.achievement.entity.Social;
import com.change.achievement.mapper.SocialMapper;
import com.change.achievement.serviceI.SocialServiceI;

@Service
public class SocialServiceImpl implements SocialServiceI {

	@Autowired
	private SocialMapper socialMapper;
	
	/**
	 * 增加社会兼职
	 * @author change
	 * @param	social
	 * @return
	 */
	@Override
	public int addSocial(Social social) {
		return socialMapper.addSocial(social);
	}
	/**
	 * 查询加社会兼职
	 * @author change
	 * @param String tid
	 * @return
	 */
	@Override
	public List<Social> selectSocial(String tid) {
		return socialMapper.selectSocial(tid);
	}
	/**
	 * 删除加社会兼职
	 * @author change
	 * @param int sid
	 * @return
	 */
	@Override
	public int delSocial(int sid) {
		return socialMapper.delSocial(sid);
	}

}
