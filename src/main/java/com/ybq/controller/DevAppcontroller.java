package com.ybq.controller;

import com.github.pagehelper.PageInfo;
import com.ybq.dto.AppInfoDTO;
import com.ybq.pojo.AppCategory;
import com.ybq.pojo.AppInfo;
import com.ybq.pojo.DataDictionary;
import com.ybq.pojo.DevUser;
import com.ybq.service.AppCategoryService;
import com.ybq.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/app")
public class DevAppcontroller {
    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private AppCategoryService appCategoryService;


    @RequestMapping("/index/{id}")
    public String index(@PathVariable("id")Long id, Model model, HttpSession session){

        session.setAttribute("USER_ID",id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(1);

        pageInfo = appInfoService.queryByDevUserId(id,pageInfo);

        List<DataDictionary> appFlatforms  = appInfoService.queryAllFlatforms();
        List<DataDictionary> appStatuses  = appInfoService.queryAllAppStatus();

        List<AppCategory> level1 = appCategoryService.queryAllLevel1();

        model.addAttribute("page",pageInfo);
        model.addAttribute("appFlatforms",appFlatforms);
        model.addAttribute("appStatuses",appStatuses);
        model.addAttribute("level1",level1);
    return "app/index";
    }

    @RequestMapping("/query")
    public String query(AppInfoDTO appInfoDTO,Model model,HttpSession session){
        Object obj = session.getAttribute("USER_ID");
        if (obj != null){
            long userId = (long) obj;
            appInfoDTO.setDevUserId(userId);

            PageInfo<AppInfo> pageInfo =  appInfoService.query(appInfoDTO);
            List<DataDictionary> appFlatforms  = appInfoService.queryAllFlatforms();
            List<DataDictionary> appStatuses  = appInfoService.queryAllAppStatus();

            List<AppCategory> level1 = appCategoryService.queryAllLevel1();
            model.addAttribute("page",pageInfo);
            model.addAttribute("appFlatforms",appFlatforms);
            model.addAttribute("appStatuses",appStatuses);
            model.addAttribute("level1",level1);
            model.addAttribute("appInfoDTO",appInfoDTO);
            return "app/index";
        }else {
            return "redirect:/";
        }
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model){
        List<DataDictionary> appStatuses  = appInfoService.queryAllAppStatus();
        List<AppCategory> level1 = appCategoryService.queryAllLevel1();
        List<DataDictionary> appFlatforms  = appInfoService.queryAllFlatforms();

        model.addAttribute("appStatuses",appStatuses);
        model.addAttribute("level1",level1);
        model.addAttribute("appFlatforms",appFlatforms);
        return "app/add";
    }

    @RequestMapping("/add")
    public String add(AppInfo appInfo,HttpSession session){
        Object id = session.getAttribute("USER_ID");
        long userId = Long.parseLong(id.toString());

       boolean flag =  appInfoService.add(appInfo,userId);

        return "forward:/app/index/"+userId;
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id")Long id,HttpSession session){
        Object uid = session.getAttribute("USER_ID");
        long userId = Long.parseLong(uid.toString());

          boolean flag = appInfoService.delete(id);
        return "forward:/app/index/"+userId;
    }
    @RequestMapping("/toEdit/{id}")
    public String toEdit(@PathVariable("id")Long id,HttpSession session,Model model){

        AppInfo appInfo = appInfoService.queryById(id);
        List<DataDictionary> appStatuses  = appInfoService.queryAllAppStatus();
        List<AppCategory> level1 = appCategoryService.queryAllLevel1();
        List<DataDictionary> appFlatforms  = appInfoService.queryAllFlatforms();

        model.addAttribute("appStatuses",appStatuses);
        model.addAttribute("level1",level1);
        model.addAttribute("appFlatforms",appFlatforms);

        model.addAttribute("app",appInfo);

        return "app/edit";
    }

    @RequestMapping("/edit")
    public String edit(AppInfo appInfo,Model model,HttpSession session){
        Object uid = session.getAttribute("USER_ID");
        Long userId = Long.parseLong(uid.toString());
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setCreateUser(devUser);
        appInfo.setModifyUser(devUser);
        appInfo.setDevUser(devUser);
        boolean row = appInfoService.update(appInfo);
        return "redirect:/app/query";
    }
}
