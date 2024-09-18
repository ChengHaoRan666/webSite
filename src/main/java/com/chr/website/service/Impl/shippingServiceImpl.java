package com.chr.website.service.Impl;

import com.chr.website.entity.payment;
import com.chr.website.entity.product;
import com.chr.website.service.shippingService;
import org.springframework.core.annotation.Order;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 * @Description:
 */
public class shippingServiceImpl implements shippingService {

    /**
     * 创建订单
     *
     */
    @Override
    public Integer orderCreate(Integer id, product product) {
        return null;
    }

    /**
     * 创建支付信息
     *
     */
    @Override
    public payment orderPayment(Order order) {
        return null;
    }

    /**
     * 添加到购物车
     *
     */
    @Override
    public Integer addCart(product product) {
        return null;
    }

    /**
     * 加入收藏
     *
     */
    @Override
    public Integer addStar(product product) {
        return null;
    }

    /**
     * 进行比较
     *
     */
    @Override
    public Integer compare(product product) {
        return null;
    }
}
