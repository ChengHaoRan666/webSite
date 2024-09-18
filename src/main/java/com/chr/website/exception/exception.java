package com.chr.website.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 14:44
 * @Description: 异常处理到错误页面
 */
@ControllerAdvice
public class exception {
    @ExceptionHandler(Exception.class)
    public String exception(Exception ex, Model model) {
        model.addAttribute("ex", ex);
        return "bug";
    }
}
