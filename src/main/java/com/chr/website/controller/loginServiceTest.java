package com.chr.website.controller;

import com.chr.website.service.Impl.loginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 程浩然
 * @Create: 2024/9/19 - 13:36
 * @Description:
 */
@Controller
public class loginServiceTest {
    @Autowired
    private loginServiceImpl loginService;

    // 用户登录
    @RequestMapping("/loginServiceTest1")
    public String loginTest() {
        Integer a = loginService.login("张三", "123", "123", "18133126910", "");
        System.out.println(a);
        return "index";
    }

    // 用户注册
    @RequestMapping("/loginServiceTest2")
    public String registerTest() {
        Integer a = loginService.register("李四", "12", "12", "", "a@qq.com", "18133126910");
        System.out.println(a);
        return "index";
    }

    // 修改用户信息
    @RequestMapping("/loginServiceTest3")
    public String ModifyInformationTest() {
        Integer a = loginService.ModifyInformation(1, "王五", "1", "1", "", "b@qq.com", "22222222222");
        System.out.println(a);
        return "index";
    }

    // 注销用户
    @RequestMapping("/loginServiceTest4")
    public String logoffTest() {
        Integer logoff = loginService.logoff(1);
        System.out.println(logoff);
        return "index";
    }
}
