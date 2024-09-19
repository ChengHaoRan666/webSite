package com.chr.website.service;

import com.chr.website.entity.product;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:10
 * @Description: 页面查看，查询的操作
 */
@Service
public interface pageService {
    /**
     * 获取全部商品用于首页展示
     */
    List<product> indexShow();

    /**
     * 获取收藏的商品
     */
    Map<product, Integer> collectShow(Integer id);

    /**
     * 获取购物车中的商品
     */
    Map<product, Integer> cartShow(Integer id);

    /**
     * 获取订单中的商品
     */
    Map<product, Integer> orderShow(Integer id);

    /**
     * 查看订单中为收货的商品
     */
    Map<product, Integer> receivedShow(Integer id);

    /**
     * 获取单个商品
     */
    product commodityShow(Integer id);

    /**
     * 关键词，商品类别，价格区间，三个搜索条件可有可无进行搜索
     */
    List<product> search(String keyword, Integer CategoryId, Integer min, Integer max);
}
