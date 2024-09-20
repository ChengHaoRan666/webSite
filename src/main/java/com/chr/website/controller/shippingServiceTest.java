package com.chr.website.controller;

import com.chr.website.service.Impl.shippingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * @Author: 程浩然
 * @Create: 2024/9/20 - 9:43
 */
@Controller
public class shippingServiceTest {
    @Autowired
    private shippingServiceImpl service;

    @RequestMapping("/shippingServiceTest1")
    public String shippingServiceTest1() {
        service.orderCreate("name1", "19111", "地址", 1, new ArrayList<>(Arrays.asList(1, 2, 3)));
        return "index";
    }

    @RequestMapping("/shippingServiceTest2")
    public String shippingServiceTest2() {
        service.addCart(1, 4, 44);
        return "index";
    }

    @RequestMapping("/shippingServiceTest3")
    public String shippingServiceTest3() {
        service.addStar(1, 4, 44);
        return "index";
    }

    @RequestMapping("/shippingServiceTest4")
    public String shippingServiceTest4() {
        service.evaluate(1, 2, 3, "评价1");
        return "index";
    }

    @RequestMapping("/shippingServiceTest5")
    public String shippingServiceTest5() {
        service.delivery(1, 2);
        return "index";
    }
}
