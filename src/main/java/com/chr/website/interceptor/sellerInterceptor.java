package com.chr.website.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * @Author: 程浩然
 * @Create: 2024/9/24 - 8:45
 * @Description: 商家拦截器，不是商家的话无法进入商家管理页面
 */
public class sellerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object userId = session.getAttribute("sellerId");
        if (userId == null) {
            response.sendRedirect("/website/login");
            return false;
        }
        return true;
    }
}
