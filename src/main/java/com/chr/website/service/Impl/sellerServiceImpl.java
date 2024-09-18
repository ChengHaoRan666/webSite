package com.chr.website.service.Impl;

import com.chr.website.entity.product;
import com.chr.website.entity.seller;
import com.chr.website.service.sellerService;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 * @Description:
 */
public class sellerServiceImpl implements sellerService {
    /**
     * 商家注册
     *
     * @param seller
     */
    @Override
    public Integer sellerRegister(seller seller) {
        return null;
    }

    /**
     * 商家管理商品
     */
    @Override
    public List<product> manage() {
        return null;
    }

    /**
     * 商家管理订单
     */
    @Override
    public Integer orderManage() {
        return null;
    }

    /**
     * 修改商家信息
     */
    @Override
    public Integer sellerModifyInformation() {
        return null;
    }

    /**
     * 商家注销
     */
    @Override
    public Integer sellerLogoff() {
        return null;
    }
}
