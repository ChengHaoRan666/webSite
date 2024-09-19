package com.chr.website.controller;

import com.chr.website.service.Impl.sellerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/19 - 17:57
 * @Description:
 */
@Controller
public class sellerServiceTest {
    @Autowired
    private sellerServiceImpl service;

    @RequestMapping("sellerServiceTest1")
    public String test1() {
        System.out.println(service.sellerLogin("1name1", "password1", "password1", "18133126910", ""));
        return "index";
    }

    @RequestMapping("sellerServiceTest2")
    public String test2() {
        System.out.println(service.sellerRegister(1, "1name1", "简介1"));
        return "index";
    }

    @RequestMapping("sellerServiceTest3")
    public String test3() {
        System.out.println(service.manage(1));
        return "index";
    }

    @RequestMapping("sellerServiceTest4")
    public String test4() {
        System.out.println(service.orderManage(1));
        return "index";
    }

    @RequestMapping("sellerServiceTest5")
    public String test5() {
        service.sellerModifyInformation(1, "user2", "password2", "password2", "", "简介2", "email", "18111111111");
        return "index";
    }

    @RequestMapping("sellerServiceTest6")
    public String test6() {
        System.out.println(service.sellerLogoff(1));
        return "index";
    }
}
