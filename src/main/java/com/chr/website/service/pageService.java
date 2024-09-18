package com.chr.website.service;

import com.chr.website.entity.product;
import org.springframework.stereotype.Service;

import java.util.List;

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
    List<product> indexShow();

    /**
     * 商品搜索
     */
    List<product> search();

    /**
     * 查看收藏
     */
    List<product> collectShow();

    /**
     * 查看购物车
     */
    List<product> cartShow();

    /**
     * 查看订单
     */
    List<product> orderShow();

    /**
     * 查看未收货
     */
    List<product> receivedShow();

    /**
     * 商品详情页展示
     */
    product commodityShow();

    /**
     * 由商品类别进行查询
     */
    List<product> showProductByCategoryID(Integer id);

    /**
     * 由价格区间进行查询
     */
    List<product> showProductByPrice(Integer min, Integer max);

    /**
     * 由商品类别和价格区间进行查询
     */
    List<product> showProductByPriceAndCategoryID(Integer id, Integer min, Integer max);
}
