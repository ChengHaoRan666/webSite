package com.chr.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/22 - 10:43
 * @Description: 收藏和购物车页面
 */
@Controller
public class CartAndStar {


    /**
     * 购物车页面
     */
    @RequestMapping("/cartShow")
    public String cartShow() {
        return "cart";
    }


    /**
     * 收藏页面
     */
    @RequestMapping("/starShow")
    public String starShow() {
        return "star";
    }



}
