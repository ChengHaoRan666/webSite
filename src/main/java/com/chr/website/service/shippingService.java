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
    Integer addCart(Integer productId);

    /**
     * 加入收藏
     */
    Integer addStar(Integer productId);

    /**
     * 进行比较
     */
    Integer compare(Integer productId);

    /**
     * 评价商品
     */
    Integer evaluate(Integer productId);

    /**
     * 确认收货
     */
    Integer delivery(Integer productId);
}
