package com.chr.website.controller;

import com.chr.website.service.Impl.loginServiceImpl;
import com.chr.website.utils.loginUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author: 程浩然
 * @Create: 2024/9/22 - 10:40
 * @Description: 用户登录和注册
 */
@Controller
public class login {
    @Autowired
    private loginServiceImpl loginService;


    /**
     * 登录页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginShow() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpSession session,
                        @RequestParam("name") String name,
                        @RequestParam("password") String password,
                        @RequestParam("phone") String phone,
                        @RequestParam("Verification_code") String inputVerificationCode
    ) {
        // 格式错误
        if (name.isEmpty() || password.isEmpty() || phone.isEmpty() || inputVerificationCode.isEmpty()) {
            session.setAttribute("loginEx", 0);
            return "login";
        }
        String codeTrue = loginUtil.getVerificationCode(phone);
        Integer i = loginService.login(name, password, password, phone, inputVerificationCode, codeTrue);
        switch (i) {
            case -1:
                session.setAttribute("loginEx", 2);
                return "login";
            case -2:
                session.setAttribute("loginEx", 0);
                return "login";
            case -3:
                session.setAttribute("loginEx", 1);
                return "login";
            default:
                session.setAttribute("userId", i);
        }
        return "redirect:/";
    }


    /**
     * 注册页面
     */
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    /**
     * 个人中心页面
     */
    @RequestMapping("/profile")
    public String profileShow() {
        return "personalHomepage";
    }
}
