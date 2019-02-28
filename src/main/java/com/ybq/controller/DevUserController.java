package com.ybq.controller;

import com.ybq.pojo.DevUser;
import com.ybq.service.AppInfoService;
import com.ybq.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/dev")
public class DevUserController {

    @Autowired
    private DevUserService userService;

    @Autowired
    private AppInfoService appInfoService;

    @RequestMapping("/login")
    public String login(DevUser devUser, Model model, HttpSession session){
        System.out.println(devUser);
        devUser = userService.login(devUser);
        if (devUser != null){
            session.setAttribute("devUser",devUser);
//            获取app分类
//            List<AppCategory> categories = appCategoryService.getAppCategoryByUserId(devUser.getId());
//            session.setAttribute("category",categories);
            return "dev/index";
        }else {
            model.addAttribute("errorMsg","登陆失败");
            return "dev/login";
        }

    }

    @RequestMapping("/logout")
    public String logout( HttpSession session){
//        session.removeAttribute("devUser");
//        session.invalidate();
        return "redirect:/index.jsp";
    }

}
