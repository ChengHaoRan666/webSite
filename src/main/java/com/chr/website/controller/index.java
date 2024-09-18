package com.chr.website.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login(HttpSession session) {
        session.setAttribute("userId", "1");
        System.out.println("login被调用了");
        return "login";
    }

    @RequestMapping("/personalHomepage")
    public String personalHomepage() {
        return "personalHomepage";
    }
}