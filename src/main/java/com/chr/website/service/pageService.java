package com.chr.website.service;

import org.springframework.stereotype.Service;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:10
 * @Description: 页面查看，查询的操作
 */
@Service
public interface pageService {
    /**
     * 主页商品展示
     */
    Integer indexShow();

    /**
     * 商品搜索
     */
    Integer search();

    /**
     * 查看收藏
     */
    Integer collectShow();

    /**
     * 查看购物车
     */
    Integer cartShow();

    /**
     * 查看订单
     */
    Integer orderShow();

    /**
     * 查看未收货
     */
    Integer receivedShow();

    /**
     * 商品详情页展示
     */
    Integer commodityShow();

    /**
     * 由商品类别进行查询
     */
    Integer showProductByCategoryID(Integer id);

    /**
     * 由价格区间进行查询
     */
    Integer showProductByPrice(Integer min, Integer max);

    /**
     * 由商品类别和价格区间进行查询
     */
    Integer showProductByPriceAndCategoryID(Integer id, Integer min, Integer max);
}
