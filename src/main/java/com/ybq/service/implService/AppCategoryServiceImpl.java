package com.ybq.service.implService;

import com.ybq.mapper.AppCategoryMapper;
import com.ybq.pojo.AppCategory;
import com.ybq.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevel1() {
        return appCategoryMapper.queryAllLevel1();
    }

    @Override
    public List<AppCategory> queryLevel2ByLevel1(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

    @Override
    public List<AppCategory> queryLevel3ByLevel2(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }
}
