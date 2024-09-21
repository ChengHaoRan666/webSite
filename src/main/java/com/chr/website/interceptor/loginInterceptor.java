package com.chr.website.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 9:40
 * @Description: 登录拦截器，实现未登录时点击任何跳转到登录界面
 */
public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*
        HttpSession session = request.getSession();
        Object userId = session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("/website/login");
            return false;
        }
         */
        return true;
    }
}
