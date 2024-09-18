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
    Integer login(user user);

    /**
     * 用户注册
     */
    Integer register(user user);

    /**
     * 修改个人信息
     */
    Integer ModifyInformation();

}
