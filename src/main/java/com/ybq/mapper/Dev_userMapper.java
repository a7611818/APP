package com.ybq.mapper;

import com.ybq.pojo.Dev_user;

public interface Dev_userMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Dev_user record);

    int insertSelective(Dev_user record);

    Dev_user selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Dev_user record);

    int updateByPrimaryKey(Dev_user record);
}