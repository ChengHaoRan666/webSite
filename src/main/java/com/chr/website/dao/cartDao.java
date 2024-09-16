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
public class cartDao {
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
     * 改
     */
    public int updateCart(Integer cartID, cart cart) {
        return cartMapper.updateCart(cartID, cart);
    }

    /**
     * 查
     */
    public List<cart> selectCart() {
        return cartMapper.selectCart();
    }
}
