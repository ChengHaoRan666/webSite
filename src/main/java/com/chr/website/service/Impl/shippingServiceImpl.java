package com.chr.website.service.Impl;


import com.chr.website.dao.*;
import com.chr.website.entity.cart;
import com.chr.website.entity.product;
import com.chr.website.entity.review;
import com.chr.website.entity.star;
import com.chr.website.service.shippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 */
@Service
public class shippingServiceImpl implements shippingService {
    @Autowired
    private orderDao orderDao;
    @Autowired
    private productDao productDao;
    @Autowired
    private cartDao cartDao;
    @Autowired
    private starDao starDao;
    @Autowired
    private reviewDao reviewDao;

    /**
     * 创建订单
     */


    /**
     * 创建订单
     */
    @Override
    public void orderCreate(String name, String phone, String address, String notes, Integer Userid, Map<Integer, Integer> productIdsAndQuantity) {
        for (Map.Entry<Integer, Integer> entry : productIdsAndQuantity.entrySet()) {
            Integer productId = Integer.parseInt(String.valueOf(entry.getKey()));
            Integer count = Integer.parseInt(String.valueOf(entry.getValue()));
            product product = productDao.selectProductById(productId);
            orderDao.addOrder(Userid, productId, product.getProductStoreID(), count, count * product.getPrice(), address, name, phone, "1", notes, new Date(), new Date(), null, null);
        }
    }

    /**
     * 添加到购物车
     */
    @Override
    public void addCart(Integer userId, Integer productId, Integer quantity) {
        cartDao.addCart(new cart(userId, productId, quantity));
    }

    /**
     * 加入收藏
     */
    @Override
    public void addStar(Integer userId, Integer productId, Integer quantity) {
        starDao.addStar(new star(userId, productId, quantity));
    }


    /**
     * 评价商品
     */
    @Override
    public void evaluate(Integer userId, Integer productId, Integer rating, String comment) {
        reviewDao.addReview(new review(productId, userId, rating, comment, new Date()));
    }

    /**
     * 确认收货
     */
    @Override
    public void delivery(Integer userId, Integer productId, String OrderStatus) {
        orderDao.updateOrderStatus(userId, productId, OrderStatus);
    }

    /**
     * 根据用户id和商品id删除订单
     */
    @Override
    public void deleteOrderByUserIdProductId(Integer userId, Integer productId) {
        orderDao.deleteByUserIdProductId(userId, productId);
    }

    /**
     * 根据用户id和商品id删除收藏
     */
    @Override
    public void deleteStarByUserIdProductId(Integer userId, Integer productId) {
        starDao.deleteStarByUserIdProductId(userId, productId);
    }

    /**
     * 根据用户id和商品id删除购物车
     */
    @Override
    public void deleteCarByUserIdProductId(Integer userId, Integer productId) {
        cartDao.deleteCartByUserIdProductId(userId, productId);
    }
}
