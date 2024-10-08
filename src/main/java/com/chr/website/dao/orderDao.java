package com.chr.website.dao;

import com.chr.website.entity.order;
import com.chr.website.mapper.orderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:15
 * @Description: 订单表
 */
@Component
public class orderDao implements orderMapper {
    @Autowired
    private orderMapper orderMapper;

    /**
     * 增
     */
    public int addOrder(Integer userId, Integer productId, Integer sellerId, Integer quantity, Double totalAmount, String deliveryAddress, String recipientName, String recipientPhone, String orderStatus, String notes, Date orderDate, Date paymentDate, Date shippingDate, Date deliveryDate) {
        try {
            return orderMapper.addOrder(userId, productId, sellerId, quantity, totalAmount, deliveryAddress, recipientName, recipientPhone, orderStatus, notes, orderDate, paymentDate, shippingDate, deliveryDate);
        } catch (Exception e) {
            System.out.println(e);
        }
        return 1;
    }

    /**
     * 删
     */
    public int deleteOrder(Integer id) {
        return orderMapper.deleteOrder(id);
    }

    /**
     * 通过用户id和商品id删除
     */
    public int deleteByUserIdProductId(Integer userId, Integer productId) {
        return orderMapper.deleteByUserIdProductId(userId, productId);
    }

    /**
     * 根据用户id删订单表
     */
    @Override
    public int deleteOrderByUserId(Integer userId) {
        return orderMapper.deleteOrderByUserId(userId);
    }

    /**
     * 修改订单状态
     */
    public int updateOrderStatus(Integer userId, Integer productId, String OrderStatus) {
        return orderMapper.updateOrderStatus(userId, productId, OrderStatus);
    }

    /**
     * 根据订单id查询订单
     */
    public order selectOrderById(Integer id) {
        return orderMapper.selectOrderById(id);
    }

    /**
     * 根据用户id查询所有用户订单
     */
    public List<order> selectOrderByUserId(Integer userId) {
        return orderMapper.selectOrderByUserId(userId);
    }

    /**
     * 根据商家id查询所有商家订单
     */
    public List<order> selectOrderBySellerID(Integer sellerId) {
        return orderMapper.selectOrderBySellerID(sellerId);
    }

    /**
     * 获取用户订单数量
     */
    public Integer getNumber(Integer userId) {
        return orderMapper.getNumber(userId);
    }
}
