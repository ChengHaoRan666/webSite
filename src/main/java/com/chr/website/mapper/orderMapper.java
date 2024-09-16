package com.chr.website.mapper;

import com.chr.website.entity.order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 8:29
 * @Description: 订单表
 */
@Component
public interface orderMapper {
    /**
     * 增
     */
    int addOrder(@Param("order") order order);

    /**
     * 删
     */
    int deleteOrder(@Param("id") Integer id);

    /**
     * 根据订单id查询订单
     */
    order selectOrderById(@Param("id") Integer id);

    /**
     * 根据用户id查询所有用户订单
     */
    List<order> selectOrderByUserId(@Param("userId") Integer userId);

    /**
     * 根据商家id查询所有商家订单
     */
    List<order> selectOrderBySellerID(@Param("sellerId") Integer sellerId);
}