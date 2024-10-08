package com.chr.website.controller;

import com.chr.website.entity.product;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

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
        return "forward:/view?id=3";
    }


    /**
     * 收藏页面
     */
    @RequestMapping("/starShow")
    public String starShow() {
        return "forward:view?id=2";
    }


    /**
     * 评价页
     */
    @RequestMapping("/evaluate")
    public String evaluate() {
        return "evaluate";
    }


    /**
     * 订单页
     */
    @RequestMapping("/checkout")
    public String checkout(HttpSession session) {
        Map<product, Integer> settleMap = (Map<product, Integer>) session.getAttribute("settleMap");
        System.out.println(settleMap);

        return "checkout";
    }


    /**
     * 创建订单
     */
    @PatchMapping("/CreateOrder")
    public String CreateOrder() {


        return "";
    }
}
