package com.ybq.service.implService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ybq.constant.CommonCodeConstant;
import com.ybq.dto.AppInfoDTO;
import com.ybq.mapper.AppInfoMapper;
import com.ybq.mapper.DataDictionaryMapper;
import com.ybq.pojo.AppInfo;
import com.ybq.pojo.DataDictionary;
import com.ybq.pojo.DevUser;
import com.ybq.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dateDictionaryMapper;

    public PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo) {

        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        AppInfoDTO a = new AppInfoDTO();
        a.setDevUserId(id);

        List<AppInfo> l = appInfoMapper.query(a);
        PageInfo<AppInfo> page = new PageInfo<>(l);

        return page;
    }

    @Override
    public List<DataDictionary> queryAllAppStatus() {
        return dateDictionaryMapper.queryAllAppStatus();
    }

    @Override
    public List<DataDictionary> queryAllFlatforms() {
        return dateDictionaryMapper.queryAllFlatforms();
    }


    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {
        PageHelper.startPage(appInfoDTO.getPageNum(),CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> l = appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> page = new PageInfo<>(l);
        return page;
    }

    @Override
    public boolean add(AppInfo appInfo, long userId) {
        appInfo.setCreationDate(new Date());
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setDevUser(devUser);
        appInfo.setCreatedBy(userId);
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setValueId(CommonCodeConstant.APP_STATUS_AUDITED);
        appInfo.setAppStatus(dataDictionary);
        int row = appInfoMapper.add(appInfo);
        return false;
    }

    @Override
    public boolean delete(Long id) {
        if(id != null){
            int row  = appInfoMapper.deleteById(id);
            return row == 1;
        }
        return false;
    }

    @Override
    public AppInfo queryById(Long id) {
        return appInfoMapper.queryById(id);
    }

    @Override
    public boolean update(AppInfo appInfo) {
         appInfo.setModifyDate(new Date());
         appInfo.setUpdateDate(new Date());

        int row = appInfoMapper.updateById(appInfo);
        return row == 1;
    }

}
