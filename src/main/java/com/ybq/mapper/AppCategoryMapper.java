package com.ybq.mapper;

import com.ybq.pojo.AppCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppCategoryMapper {
    List<AppCategory> queryAllLevel1();

    List<AppCategory> queryLevelByParentId(@Param("id") Long id);
}
