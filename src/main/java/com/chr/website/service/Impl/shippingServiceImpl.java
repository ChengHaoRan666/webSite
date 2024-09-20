package com.chr.website.service.Impl;

import com.chr.website.dao.orderDao;
import com.chr.website.dao.productDao;
import com.chr.website.entity.order;
import com.chr.website.entity.product;
import com.chr.website.service.shippingService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 */
public class shippingServiceImpl implements shippingService {
    @Autowired
    private orderDao orderDao;
    @Autowired
    private productDao productDao;


    /**
     * 创建订单
     */
    @Override
    public void orderCreate(String name, String phone, String DeliveryAddress, Integer Userid, List<Integer> productIds) {
        for (Integer productId : productIds) {
            product product = productDao.selectProductById(productId);
            orderDao.addOrder(new order(Userid, productId, product.getProductStoreID(), product.getPrice(), DeliveryAddress, name, phone, "1", new Date(), null, null, null));
        }
    }


    /**
     * 添加到购物车
     */
    @Override
    public Integer addCart(Integer productId) {
        return null;
    }

    /**
     * 加入收藏
     */
    @Override
    public Integer addStar(Integer productId) {
        return null;
    }

    /**
     * 进行比较
     */
    @Override
    public Integer compare(Integer productId) {
        return null;
    }

    /**
     * 评价商品
     */
    @Override
    public Integer evaluate(Integer productId) {
        return null;
    }

    /**
     * 确认收货
     */
    @Override
    public Integer delivery(Integer productId) {
        return null;
    }
}
