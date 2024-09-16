package com.chr.website.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 8:28
 * @Description: 订单
 */
@Component
public class order {
    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer sellerId;
    private Double totalAmount;
    private String deliveryAddress;
    private String recipientName;
    private String recipientPhone;
    private String orderStatus;
    private Date orderDate;
    private Date paymentDate;
    private Date shippingDate;
    private Date deliveryDate;

    public order() {
    }

    public order(Integer userId, Integer productId, Integer sellerId, Double totalAmount, String deliveryAddress, String recipientName, String recipientPhone, String orderStatus, Date orderDate, Date paymentDate, Date shippingDate, Date deliveryDate) {
        this.userId = userId;
        this.productId = productId;
        this.sellerId = sellerId;
        this.totalAmount = totalAmount;
        this.deliveryAddress = deliveryAddress;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.paymentDate = paymentDate;
        this.shippingDate = shippingDate;
        this.deliveryDate = deliveryDate;
    }

    @Override
    public String toString() {
        return "order{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", sellerId=" + sellerId +
                ", totalAmount=" + totalAmount +
                ", deliveryAddress='" + deliveryAddress + '\'' +
                ", recipientName='" + recipientName + '\'' +
                ", recipientPhone='" + recipientPhone + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderDate=" + orderDate +
                ", paymentDate=" + paymentDate +
                ", shippingDate=" + shippingDate +
                ", deliveryDate=" + deliveryDate +
                '}';
    }
}
