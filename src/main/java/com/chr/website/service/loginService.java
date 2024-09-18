package com.chr.website.service;

import com.chr.website.entity.user;
import org.springframework.stereotype.Service;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 10:28
 * @Description: 用户登录注册的操作
 */
@Service
public interface loginService {
    /**
     * 用户登录
     */
    Integer login(String username, String password1, String password2, String phone, String code);

    /**
     * 用户注册
     */
    Integer register(String username,String password1,String password2,String code,String email,String phone);

    /**
     * 修改个人信息
     */
    Integer ModifyInformation(Integer id, user user);

    /**
     * 注销用户
     */
    Integer logoff(Integer id);
}
