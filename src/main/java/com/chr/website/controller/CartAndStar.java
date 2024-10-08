package com.chr.website.controller;

import com.chr.website.dao.orderDao;
import com.chr.website.entity.order;
import com.chr.website.entity.product;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collections;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/22 - 10:43
 * @Description: 收藏和购物车页面
 */
@Controller
public class CartAndStar {
    @Autowired
    private orderDao orderDao;

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
        double settleCount = 0.0;
        for (product product : settleMap.keySet()) settleCount += product.getPrice() * settleMap.get(product);
        session.setAttribute("settleCount", settleCount);
        return "checkout";
    }


    /**
     * 创建订单
     */
    @RequestMapping(value = "/CreateOrder", method = RequestMethod.POST)
    public ResponseEntity<?> CreateOrder(HttpSession session, @RequestBody Map<String, Object> payload) {
        String name = (String) payload.get("name");
        String phone = (String) payload.get("phone");
        String address = (String) payload.get("address");
        Boolean wechatPay = (Boolean) payload.get("wechatPay");
        Boolean AlipayPay = (Boolean) payload.get("AlipayPay");
        Map<Integer, Integer> productIds = (Map<Integer, Integer>) payload.get("products");
        System.out.println("11111111111111111111111111111111111111111111111111");
        System.out.println(name + " " + phone + " " + address + " " + wechatPay + " " + AlipayPay);
        System.out.println("222222222222222222222222222222222222222222222222222");
        System.out.println(productIds);

        new order((Integer) session.getAttribute("userId"), )
        return ResponseEntity.ok().body(Collections.singletonMap("message", "订单生成成功"));
    }
}
