package com.ybq.mapper;

import com.ybq.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DevUserMapper {
    List<DevUser> queryByNamePwd(DevUser dev_user);

    Integer checkDevCode(@Param("devCode") String devCode);

    int register(DevUser devUser);
}
