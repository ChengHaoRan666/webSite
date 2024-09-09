package com.chr.website.controller;

import com.chr.website.entity.user;
import com.chr.website.mapper.userMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {
    @RequestMapping("/")
    public String index() {
        return "Home/index";
    }

    @Autowired
    private userMapper user;

    @RequestMapping("/get")
    public String getAll() {
        List<user> all = user.getAll();
        for (user user : all)
            System.out.println(user);
        return "succes";
    }
}
