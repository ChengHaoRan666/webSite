package com.chr.website.mapper;

import com.chr.website.entity.cart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 11:13
 * @Description: 购物车
 */
@Component
public interface cartMapper {
    /**
     * 增
     */
    int addCart(@Param("cart") cart cart);

    /**
     * 删
     */
    int deleteCart(@Param("CartID") Integer CartID);

    /**
     * 改
     */
    int updateCart(@Param("CartID") Integer cartID, @Param("cart") cart cart);

    /**
     * 查
     */
    List<cart> selectCart(@Param("UserId") Integer userId);
}
