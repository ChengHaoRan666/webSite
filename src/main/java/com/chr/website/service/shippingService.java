package com.chr.website.service;

import com.chr.website.entity.payment;
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
    Integer orderCreate(Integer id, Integer productId);

    /**
     * 创建支付信息
     */
    payment orderPayment(Integer orderId);

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
