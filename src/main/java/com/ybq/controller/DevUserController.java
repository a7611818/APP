package com.ybq.controller;

import com.ybq.pojo.DevUser;
import com.ybq.service.AppInfoService;
import com.ybq.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/dev")
public class DevUserController {

    @Autowired
    private DevUserService userService;

    @Autowired
    private AppInfoService appInfoService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response,DevUser devUser, Model model, HttpSession session){

        String code = request.getParameter("code");
        // 验证验证码
        String sessionCode = request.getSession().getAttribute("code").toString();
        if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode)) {
            if (code.equalsIgnoreCase(sessionCode)) {
                //通过验证

                devUser = userService.login(devUser);
                if (devUser != null){
                    session.setAttribute("devUser",devUser);
//            获取app分类
//            List<AppCategory> categories = appCategoryService.getAppCategoryByUserId(devUser.getId());
//            session.setAttribute("category",categories);
                    return "dev/index";
                }else {
                    model.addAttribute("errorMsg","账号或密码不正确");
                    return "dev/login";
                }

            } else {
                model.addAttribute("errorMsg","验证码错误");
                return "dev/login";
            }
        } else {
            model.addAttribute("errorMsg","验证码错误");
            return "dev/login";
        }


    }

    @RequestMapping("/logout")
    public String logout( HttpSession session){
        session.removeAttribute("devUser");
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){

        return "dev/register";
    }
    @RequestMapping("/register")
    public String register(DevUser devUser,Model model){
        //注册
        boolean ck = userService.checkDevCode(devUser.getDevCode());
        if (ck){
            //可以注册
            boolean row =  userService.register(devUser);
            model.addAttribute("errorMsg","注册成功");
            return "dev/login";

        }else{
            //不可以注册

            model.addAttribute("errorMsg","账号已存在，请直接登录");
            return "dev/register";
        }

    }

}
