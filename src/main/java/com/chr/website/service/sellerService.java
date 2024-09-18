package com.chr.website.service;

import org.springframework.stereotype.Service;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 10:28
 * @Description: 商家的操作<br>
 * 登录，注册，管理商品
 */
@Service
public interface sellerService {
    /**
     * 商家注册
     */
    Integer sellerRegister();

    /**
     * 商家管理商品
     */
    Integer manage();

    /**
     * 商家管理订单
     */
    Integer orderManage();
/**
 * 修改商家信息
 */
}
