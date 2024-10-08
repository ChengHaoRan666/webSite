package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
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
    private shippingServiceImpl shippingService;
    @Autowired
    private pageServiceImpl pageService;

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
    public String evaluate(HttpSession session) {
        // 更新数据
        // 获取收藏列表，购物车列表
        Map<product, Integer> starMap = pageService.collectShow((Integer) session.getAttribute("userId"));
        Map<product, Integer> cartMap = pageService.cartShow((Integer) session.getAttribute("userId"));

        // 购物车数量
        session.setAttribute("starCount", starMap.size());
        // 收藏数量
        session.setAttribute("cartCount", cartMap.size());
        // 收藏，购物车列表
        session.setAttribute("starMap", starMap);
        session.setAttribute("cartMap", cartMap);
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
        String notes = (String) payload.get("notes");
        Map<Integer, Integer> productIds = (Map<Integer, Integer>) payload.get("products");
        Integer userId = (Integer) session.getAttribute("userId");
        shippingService.orderCreate(name, phone, address, notes, userId, productIds);
        return ResponseEntity.ok().body(Collections.singletonMap("message", "订单生成成功"));
    }
}
