package com.chr.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/10/27 - 16:36
 * @Description: 用于商家的操作
 */
@Controller
public class sellerManage {
    /**
     * 商家页面
     */
    @RequestMapping("/sellerProfile")
    public String sellerShow() {
        return "merchantHomepage";
    }
}
