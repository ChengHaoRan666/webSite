package com.chr.website.entity;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 9:31
 * @Description: 支付信息表
 */
public class payment {
    private Integer id;
    private Integer orderId;
    private Integer userId;
    private Double paymentAmount;
    private String paymentMethod;
    private String paymentStatus;
    private Date paymentTime;

    public payment() {
    }

    public payment(Integer orderId, Integer userId, Double paymentAmount, String paymentMethod, String paymentStatus, Date paymentTime) {
        this.orderId = orderId;
        this.userId = userId;
        this.paymentAmount = paymentAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentTime = paymentTime;
    }

    @Override
    public String toString() {
        return "payment{" +
                "paymentId=" + id +
                ", orderId=" + orderId +
                ", userId=" + userId +
                ", paymentAmount=" + paymentAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", paymentStatus='" + paymentStatus + '\'' +
                ", paymentTime=" + paymentTime +
                '}';
    }
}
