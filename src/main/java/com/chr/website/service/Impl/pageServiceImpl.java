package com.chr.website.service.Impl;

import com.chr.website.entity.product;
import com.chr.website.service.pageService;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:59
 * @Description:
 */
public class pageServiceImpl implements pageService {

    /**
     * 主页商品展示
     */
    @Override
    public List<product> indexShow() {
        return null;
    }

    /**
     * 商品搜索
     */
    @Override
    public List<product> search() {
        return null;
    }

    /**
     * 查看收藏
     */
    @Override
    public List<product> collectShow() {
        return null;
    }

    /**
     * 查看购物车
     */
    @Override
    public List<product> cartShow() {
        return null;
    }

    /**
     * 查看订单
     */
    @Override
    public List<product> orderShow() {
        return null;
    }

    /**
     * 查看未收货
     */
    @Override
    public List<product> receivedShow() {
        return null;
    }

    /**
     * 商品详情页展示
     */
    @Override
    public product commodityShow() {
        return null;
    }

    /**
     * 由商品类别进行查询
     *
     * @param id
     */
    @Override
    public List<product> showProductByCategoryID(Integer id) {
        return null;
    }

    /**
     * 由价格区间进行查询
     *
     * @param min
     * @param max
     */
    @Override
    public List<product> showProductByPrice(Integer min, Integer max) {
        return null;
    }

    /**
     * 由商品类别和价格区间进行查询
     *
     * @param id
     * @param min
     * @param max
     */
    @Override
    public List<product> showProductByPriceAndCategoryID(Integer id, Integer min, Integer max) {
        return null;
    }
}
