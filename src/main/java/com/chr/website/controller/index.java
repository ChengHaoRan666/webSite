package com.chr.website.controller;

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
    public String index1() {
        return "index";
    }

    @RequestMapping("/1")
    public String index2() {
        return "bug";
    }

    @RequestMapping("/2")
    public String index3() {
        return "checkout";
    }

    @RequestMapping("/3")
    public String index4() {
        return "login";
    }

    @RequestMapping("/4")
    public String index5() {
        return "merchantHomepage";
    }

    @RequestMapping("/5")
    public String index6() {
        return "personalHomepage";
    }

    @RequestMapping("/6")
    public String index7() {
        return "product";
    }

    @RequestMapping("/7")
    public String index8() {
        return "register";
    }

    @RequestMapping("/8")
    public String index9() {
        return "shoppingRegister";
    }

    @RequestMapping("/9")
    public String index10() {
        return "store";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }
}