package com.chr.website.mapper;

import com.chr.website.entity.order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
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
    int addOrder(
            @Param("userId") Integer userId,
            @Param("productId") Integer productId,
            @Param("sellerId") Integer sellerId,
            @Param("quantity") Integer quantity,
            @Param("totalAmount") Double totalAmount,
            @Param("deliveryAddress") String deliveryAddress,
            @Param("recipientName") String recipientName,
            @Param("recipientPhone") String recipientPhone,
            @Param("orderStatus") String orderStatus,
            @Param("notes") String notes,
            @Param("orderDate") Date orderDate,
            @Param("paymentDate") Date paymentDate,
            @Param("shippingDate") Date shippingDate,
            @Param("deliveryDate") Date deliveryDate
    );

    /**
     * 删
     */
    int deleteOrder(@Param("id") Integer id);

    /**
     * 根据用户id删订单表
     */
    int deleteOrderByUserId(@Param("userId") Integer userId);

    /**
     * 修改订单状态
     */
    int updateOrderStatus(@Param("userId") Integer id, @Param("productId") Integer productId, @Param("OrderStatus") String OrderStatus);

    /**
     * 修改订单状态
     */
    int updateOrderStatusByOrderId(@Param("orderId") Integer orderId, @Param("OrderStatus") String OrderStatus);

    /**
     * 通过userId和 ProductID删除
     */
    int deleteByUserIdProductId(@Param("userId") Integer userId, @Param("ProductId") Integer ProductId);

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

    /**
     * 获取用户订单数量
     */
    Integer getNumber(@Param("userId") Integer userId);

    /**
     * 获取已签收未评价的商品
     */
    List<order> getNoEvaluationOrder(@Param("userId") Integer userId);

    /**
     * 修改订单收货时间
     */
    void updateOrderDeliveryDate(@Param("orderId")Integer orderId, @Param("deliveryDate")Date deliveryDate);
    /**
     * 修改订单发货时间
     */
    void updateOrderShippingDate(@Param("orderId")Integer orderId, @Param("shippingDate")Date shippingDate);


}
