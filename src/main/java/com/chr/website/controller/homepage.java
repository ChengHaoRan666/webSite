package com.chr.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author: 程浩然
 * @Create: 2024/9/24 - 17:22
 * @Description: 主页的操作
 */
@Controller
public class homepage {
    /**
     * 个人中心页面
     */
    @RequestMapping("/profile")
    public String profileShow() {
        return "personalHomepage";
    }



    /**
     * 修改个人信息
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyShow() {
        return "modifyInformation";
    }

    /*
    <div th:switch="${session.modifyEx}">
                <p th:case="1">两次密码不对</p>
                <p th:case="2">手机号格式错误</p>
                <p th:case="3">验证码错误</p>
                <p th:case="4">输入错误</p>
                <p th:case="*">输入信息：</p>
            </div>
     */

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify() {

        return "modifyInformation";
    }
}
