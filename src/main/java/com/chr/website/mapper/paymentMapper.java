package com.chr.website.mapper;

import com.chr.website.entity.payment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 9:34
 * @Description: payment表
 */
@Component
public interface paymentMapper {
    /**
     * 增
     */
    int addPayment(@Param("payment") payment payment);

    /**
     * 删
     */
    int deletePayment(@Param("id") Integer id);

    /**
     * 根据订单支付信息id查询订单支付
     */
    payment selectPaymentById(@Param("id") Integer id);

    /**
     * 根据订单支付信息id查询所有用户订单支付
     */
    List<payment> selectPaymentByUserId(@Param("userId") Integer userId);

}
