package com.chr.website.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/22 - 10:40
 * @Description: 用户登录和注册
 */
@Controller
public class login {
    /**
     * 登录页面
     */
    @RequestMapping("/login")
    public String login(HttpSession session) {
        session.setAttribute("userId", 1);
        return "login";
    }

    /**
     * 注册页面
     */
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    /**
     * 个人中心页面
     */
    @RequestMapping("/profile")
    public String profileShow() {
        return "personalHomepage";
    }
}
