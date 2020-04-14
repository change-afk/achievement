package com.change.achievement.mapper;

import java.util.List;

import com.change.achievement.entity.Social;

public interface SocialMapper {
	
    int delSocial(Integer sid);//删除社会兼职

    int addSocial(Social social);//增加社会兼职

    List<Social> selectSocial(String tid);//查询社会兼职

    int insertSelective(Social record);

    int updateByPrimaryKeySelective(Social record);

    int updateByPrimaryKey(Social record);
}