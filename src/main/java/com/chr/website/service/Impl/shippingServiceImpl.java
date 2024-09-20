package com.chr.website.service.Impl;

import com.chr.website.entity.payment;
import com.chr.website.service.shippingService;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 */
public class shippingServiceImpl implements shippingService {
    /**
     * 创建订单
     *
     */
    @Override
    public Integer orderCreate(Integer id, Integer productId) {
        return null;
    }

    /**
     * 创建支付信息
     */
    @Override
    public payment orderPayment(Integer orderId) {
        return null;
    }

    /**
     * 添加到购物车
     */
    @Override
    public Integer addCart(Integer productId) {
        return null;
    }

    /**
     * 加入收藏
     */
    @Override
    public Integer addStar(Integer productId) {
        return null;
    }

    /**
     * 进行比较
     */
    @Override
    public Integer compare(Integer productId) {
        return null;
    }

    /**
     * 评价商品
     */
    @Override
    public Integer evaluate(Integer productId) {
        return null;
    }

    /**
     * 确认收货
     */
    @Override
    public Integer delivery(Integer productId) {
        return null;
    }
}
