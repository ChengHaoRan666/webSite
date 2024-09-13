package com.chr.website.controller;

import com.chr.website.mapper.userMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {

    @Autowired
    private userMapper userMapper;

    @RequestMapping("/")
    public String index(HttpSession session) {
        return "index";
    }
}
