package com.chr.website.dao;

import com.chr.website.entity.order;
import com.chr.website.mapper.orderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:15
 * @Description: 订单表
 */
@Component
public class orderDao implements orderMapper{
    @Autowired
    private orderMapper orderMapper;

    /**
     * 增
     */
    public int addOrder(order order) {
        return orderMapper.addOrder(order);
    }

    /**
     * 删
     */
    public int deleteOrder(Integer id) {
        return orderMapper.deleteOrder(id);
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
