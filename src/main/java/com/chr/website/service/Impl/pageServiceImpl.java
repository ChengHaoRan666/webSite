package com.chr.website.service.Impl;

import com.chr.website.dao.*;
import com.chr.website.entity.*;
import com.chr.website.service.pageService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:59
 */
@Service
public class pageServiceImpl implements pageService {
    @Autowired
    private productDao productDao; // 商品表
    @Autowired
    private starDao starDao; // 收藏表
    @Autowired
    private cartDao cartDao; // 购物车表
    @Autowired
    private orderDao orderDao; // 订单表
    @Autowired
    private reviewDao reviewDao; // 评价表


    /**
     * 获取全部商品用于首页展示
     */
    @Override
    public List<product> indexShow() {
        return productDao.selectProductAll();
    }

    /**
     * 获取收藏的商品
     */
    @Override
    public Map<product, Integer> collectShow(Integer id) {
        List<star> stars = starDao.selectStar(id);
        Map<product, Integer> map = new HashMap<>();
        for (star star : stars) {
            product product = productDao.selectProductById(star.getProductID());
            if (map.containsKey(product)) map.put(product, map.get(product) + star.getQuantity());
            else map.put(product, 1);
        }
        return map;
    }

    /**
     * 获取购物车中的商品
     */
    @Override
    public Map<product, Integer> cartShow(Integer id) {
        List<cart> carts = cartDao.selectCart(id);
        Map<product, Integer> map = new HashMap<>();
        for (cart cart : carts) {
            product product = productDao.selectProductById(cart.getProductID());
            if (map.containsKey(product)) map.put(product, map.get(product) + cart.getQuantity());
            else map.put(product, cart.getQuantity());
        }
        return map;
    }

    /**
     * 获取订单中的商品
     */
    @Override
    public List<String[]> orderShow(Integer id) {
        List<order> orders = orderDao.selectOrderByUserId(id);
        List<String[]> list = new ArrayList<>();
        for (order order : orders) {
            product product = productDao.selectProductById(order.getProductId());
            list.add(new String[]{String.valueOf(product.getId()), product.getName(), String.valueOf(product.getPrice()), String.valueOf(order.getQuantity()), String.valueOf(order.getTotalAmount()), String.valueOf(product.getCategoryId()), order.getOrderStatus(), String.valueOf(order.getId())});
        }
        return list;
    }

    /**
     * 查看订单中未收货的商品
     */
    @Override
    public List<String[]> receivedShow(Integer id) {
        List<order> orders = orderDao.selectOrderByUserId(id);
        List<String[]> list = new ArrayList<>();
        for (order order : orders) {
            product product = productDao.selectProductById(order.getProductId());
            if (order.getOrderStatus().equals("3")) continue;
            list.add(new String[]{String.valueOf(product.getId()), product.getName(), String.valueOf(product.getPrice()), String.valueOf(order.getQuantity()), String.valueOf(order.getTotalAmount()), String.valueOf(product.getCategoryId()), order.getOrderStatus(), String.valueOf(order.getId())});

        }
        return list;
    }

    /**
     * 获取单个商品
     */
    @Override
    public product commodityShow(Integer id) {
        return productDao.selectProductById(id);
    }

    /**
     * 关键词，商品类别，价格区间，三个搜索条件可有可无进行搜索
     */
    @Override
    public List<product> search(String keyword, Integer CategoryId, Integer min, Integer max) {
        return productDao.search(keyword, CategoryId, min, max);
    }

    /**
     * 获取商品评分
     */
    @Override
    public List<Integer> getRating(Integer productId) {
        List<review> reviews = reviewDao.selectReviewByproductId(productId);
        List<Integer> list = new ArrayList<>();
        for (review review : reviews) list.add(review.getRating());
        return list;
    }


    /**
     * 获取商品评价
     */
    @Override
    public List<review> getComment(Integer productId,Integer pageNumber) {
        PageHelper.startPage(pageNumber, 3); // 开启分页功能,设置每次查3个
        return reviewDao.selectReviewByproductId(productId);
    }

    /**
     * 通过商品id获得商品属性
     */
    @Override
    public Map<String, String> getAttribute(String productDescription) {
        if (productDescription.isEmpty()) return null;
        // 属性用；分割 其中商品类型是 key={val1,val2...}
        // 存储容量={12+128,16+256};3C认证={xxxxx};...
        String[] attributes = productDescription.split(";");
        Map<String, String> attributeMap = new HashMap<>();
        for (String attribute : attributes) {
            String[] tmp = attribute.split("=");
            // 将属性，类型放入Map
            attributeMap.put(tmp[0], tmp[1].substring(1, tmp[1].length() - 1));
        }
        return attributeMap;
    }
}
