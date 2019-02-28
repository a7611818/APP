package com.ybq.controller;

import com.ybq.pojo.AppCategory;
import com.ybq.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class AppCategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/queryLevel2ByLevel1/{level1Id}")
    @ResponseBody
    public List<AppCategory> queryLevel2ByLevel1(@PathVariable("level1Id")Long id ){
        List<AppCategory> level2=appCategoryService.queryLevel2ByLevel1(id);
        return level2;
    }

    @RequestMapping("/queryLevel3ByLevel2/{level2Id}")
    @ResponseBody
    public List<AppCategory> queryLevel3ByLevel2(@PathVariable("level2Id")Long id ){
        List<AppCategory> level3=appCategoryService.queryLevel3ByLevel2(id);
        return level3;
    }
}
