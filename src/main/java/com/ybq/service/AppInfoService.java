package com.ybq.service;

import com.github.pagehelper.PageInfo;
import com.ybq.dto.AppInfoDTO;
import com.ybq.pojo.AppInfo;
import com.ybq.pojo.DataDictionary;

import java.util.List;

public interface AppInfoService {
    PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo);

    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatforms();

    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo, long userId);

    boolean delete(Long id);

    AppInfo queryById(Long id);

    boolean update(AppInfo appInfo);
}
