package com.change.achievement.mapper;

import com.change.achievement.entity.Content2;

public interface Content2Mapper {
    int deleteByPrimaryKey(Integer tcoid);

    int insert(Content2 record);

    int insertSelective(Content2 record);

    Content2 selectByPrimaryKey(Integer tcoid);

    int updateByPrimaryKeySelective(Content2 record);

    int updateByPrimaryKey(Content2 record);
}