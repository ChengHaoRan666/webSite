package com.chr.website.dao;

import com.chr.website.entity.payment;
import com.chr.website.mapper.paymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: payment 表
 */
@Component
public class paymentDao {
    @Autowired
    private paymentMapper paymentMapper;

    /**
     * 增
     */
    public int addPayment(payment payment) {
        return paymentMapper.addPayment(payment);
    }

    /**
     * 删
     */
    public int deletePayment(Integer id) {
        return paymentMapper.deletePayment(id);
    }

    /**
     * 根据订单支付信息id查询订单支付
     */
    public payment selectPaymentById(Integer id) {
        return paymentMapper.selectPaymentById(id);
    }

    /**
     * 根据订单支付信息id查询所有用户订单支付
     */
    public List<payment> selectPaymentByUserId(Integer userId) {
        return paymentMapper.selectPaymentByUserId(userId);
    }
}
