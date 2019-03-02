package com.ybq.mapper;

import com.ybq.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatforms();
}