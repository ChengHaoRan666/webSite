package com.chr.website.service;

import org.springframework.stereotype.Service;

import java.util.List;

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
    void orderCreate(String name, String phone, String DeliveryAddress, Integer Userid, List<Integer> productIds);

    /**
     * 添加到购物车
     */
    void addCart(Integer userId, Integer productId, Integer quantity);

    /**
     * 加入收藏
     */
    void addStar(Integer userId, Integer productId, Integer quantity);

    /**
     * 评价商品
     */
    void evaluate(Integer userId, Integer productId, Integer rating, String comment);

    /**
     * 确认收货
     */
    void delivery(Integer id, Integer productId);
}