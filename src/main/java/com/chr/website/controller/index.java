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
    public String index() {
        return "index";
    }

    @RequestMapping("/a")
    public String a() {
        return "blank";
    }

    @RequestMapping("/b")
    public String b() {
        return "checkout";
    }

    @RequestMapping("/c")
    public String c() {
        return "product";
    }

    @RequestMapping("/d")
    public String d() {
        return "store";
    }
}
