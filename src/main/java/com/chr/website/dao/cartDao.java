package com.chr.website.dao;

import com.chr.website.entity.cart;
import com.chr.website.mapper.cartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:07
 * @Description: 购物车
 */
@Component
public class cartDao implements cartMapper {
    @Autowired
    private cartMapper cartMapper;

    /**
     * 增
     */
    public int addCart(cart cart) {
        return cartMapper.addCart(cart);
    }

    /**
     * 删
     */
    public int deleteCart(Integer CartID) {
        return cartMapper.deleteCart(CartID);
    }

    /**
     * 根据用户id删购物车
     */
    @Override
    public int deleteCartByUserId(Integer userId) {
        return cartMapper.deleteCartByUserId(userId);
    }

    /**
     * 根据用户id和商品id删
     */
    @Override
    public int deleteCartByUserIdProductId(Integer userId, Integer ProductId) {
        return cartMapper.deleteCartByUserIdProductId(userId, ProductId);
    }

    /**
     * 根据商品id删除购物车（下架）
     */
    @Override
    public int deleteCartByProductId(Integer productId) {
        return cartMapper.deleteCartByProductId(productId);
    }

    /**
     * 改
     */
    public int updateCart(Integer cartID, cart cart) {
        return cartMapper.updateCart(cartID, cart);
    }

    /**
     * 查
     */
    public List<cart> selectCart(Integer userId) {
        return cartMapper.selectCart(userId);
    }
}
