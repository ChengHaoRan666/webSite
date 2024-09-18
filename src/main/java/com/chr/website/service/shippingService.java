package com.chr.website.service;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:11
 * @Description: 用户购物时的操作<br>
 * 加入购物车，收藏，创建订单，支付，评价，比较
 */
@Service
public interface shippingService {
    /**
     * 创建订单
     */
    Integer orderCreate(Order order);

    /**
     * 添加到购物车
     */
    Integer addCart();

    /**
     * 加入收藏
     */
    Integer addStar();

    /**
     * 进行比较
     */
    Integer compare();
}
