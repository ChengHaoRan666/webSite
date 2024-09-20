package com.chr.website.service.Impl;


import com.chr.website.dao.*;
import com.chr.website.entity.*;
import com.chr.website.service.shippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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
    @Override
    public void orderCreate(String name, String phone, String DeliveryAddress, Integer Userid, List<Integer> productIds) {
        for (Integer productId : productIds) {
            product product = productDao.selectProductById(productId);
            orderDao.addOrder(new order(Userid, productId, product.getProductStoreID(), product.getPrice(), DeliveryAddress, name, phone, "1", new Date(), new Date(), null, null));
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
    public void delivery(Integer id, Integer productId) {
        orderDao.updateOrderStatus(id, productId + "");
    }
}
