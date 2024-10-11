package com.chr.website.service;

import com.chr.website.entity.order;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
    void orderCreate(String name, String phone, String address, String notes, Integer Userid, Map<Integer, Integer> productIdsAndQuantity);

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
     * 修改订单状态
     */
    void delivery(Integer userId, Integer productId, String OrderStatus);

    /**
     * 修改订单状态
     */
    void delivery(Integer orderId, String OrderStatus);


    /**
     * 根据用户id和商品id删除订单
     */
    void deleteOrderByUserIdProductId(Integer userId, Integer productId);

    /**
     * 通过orderId删除
     */
    void deleteOrderByOrderId(Integer orderId);


    /**
     * 根据用户id和商品id删除收藏
     */
    void deleteStarByUserIdProductId(Integer userId, Integer productId);


    /**
     * 根据用户id和商品id删除购物车
     */
    void deleteCarByUserIdProductId(Integer userId, Integer productId);

    /**
     * 通过orderId获取productId
     */
    List<Integer> getProductIdByOrderId(List<Integer> orderIdList);

    /**
     * 通过orderId获取productId
     */
    Integer getProductIdByOrderId(Integer orderId);

    /**
     * 获取已收货未评价订单
     */
    List<order> getNoEvaluationOrder(Integer userId);

    /**
     * 设置订单收货时间
     */
    void setOrderDeliveryDate(Integer orderId, Date deliveryDate);
    /**
     * 设置订单发货时间
     */
    void setOrderShippingDate(Integer orderId, Date shippingDate);

}
