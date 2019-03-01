package com.ybq.mapper;

import com.ybq.dto.AppInfoDTO;
import com.ybq.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

    List<AppInfo> query(AppInfoDTO appInfoDTO);

    int add(AppInfo appInfo);

    int deleteById(@Param("id") Long id);

    AppInfo queryById(@Param("id") Long id);

    int updateById(AppInfo appInfo);

    AppInfo queryDetailById(@Param("id") Long id);
}
