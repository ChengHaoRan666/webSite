package com.chr.website.config;

import jakarta.servlet.Filter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:08
 * @Description: webInit.java 代替 web.xml
 */

public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer {

    /**
     * 指定 Spring 配置类
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{SpringConfig.class};
    }


    /**
     * 指定 SpringMVC 配置类
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class};
    }

    /**
     * 指定 DispatcherServlet 的映射规则，即 url-pattern
     */
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    /**
     * 添加过滤器
     */
    @Override
    protected Filter[] getServletFilters() {
        // 字符过滤器
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceResponseEncoding(true);

        // HiddenHttpMethodFilter 过滤器（用于将get和post请求转换为put和delete请求）
        HiddenHttpMethodFilter hiddenHttpMethodFilter = new HiddenHttpMethodFilter();
        return new Filter[]{characterEncodingFilter, hiddenHttpMethodFilter};
    }
}