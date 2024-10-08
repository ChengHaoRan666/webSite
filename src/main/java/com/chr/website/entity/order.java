package com.chr.website.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 8:28
 * @Description: 订单
 */
@Data
@Component
public class order {
    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer sellerId;
    private Integer quantity;
    private Double totalAmount;
    private String deliveryAddress;
    private String recipientName;
    private String recipientPhone;
    private String notes;
    private String orderStatus;
    private Date orderDate;
    private Date paymentDate;
    private Date shippingDate;
    private Date deliveryDate;

    public order() {
    }

    public order(Integer userId, Integer productId, Integer sellerId, Integer quantity, Double totalAmount, String deliveryAddress, String recipientName, String recipientPhone, String orderStatus, String notes, Date orderDate, Date paymentDate, Date shippingDate, Date deliveryDate) {
        this.userId = userId;
        this.productId = productId;
        this.sellerId = sellerId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.deliveryAddress = deliveryAddress;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.notes = notes;
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
                ", quantity=" + quantity +
                ", totalAmount=" + totalAmount +
                ", deliveryAddress='" + deliveryAddress + '\'' +
                ", recipientName='" + recipientName + '\'' +
                ", recipientPhone='" + recipientPhone + '\'' +
                ", notes='" + notes + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderDate=" + orderDate +
                ", paymentDate=" + paymentDate +
                ", shippingDate=" + shippingDate +
                ", deliveryDate=" + deliveryDate +
                '}';
    }
}
