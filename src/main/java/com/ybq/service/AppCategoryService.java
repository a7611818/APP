package com.ybq.service;

import com.ybq.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryAllLevel1();

    List<AppCategory> queryLevel2ByLevel1(Long id);

    List<AppCategory> queryLevel3ByLevel2(Long id);
}
