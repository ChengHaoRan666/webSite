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
     * 根据用户id删购物车
     */
    int deleteCartByUserId(@Param("userId") Integer userId);

    /**
     * 根据用户id和商品id删
     */
    int deleteCartByUserIdProductId(@Param("userId") Integer userId, @Param("ProductId") Integer ProductId);

    /**
     * 根据商品id删除购物车（下架）
     */
    int deleteCartByProductId(@Param("productId") Integer productId);

    /**
     * 改
     */
    int updateCart(@Param("CartID") Integer cartID, @Param("cart") cart cart);

    /**
     * 查
     */
    List<cart> selectCart(@Param("UserId") Integer userId);
}
