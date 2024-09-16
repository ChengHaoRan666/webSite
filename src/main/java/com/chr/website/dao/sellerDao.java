package com.chr.website.dao;

import com.chr.website.entity.seller;
import com.chr.website.mapper.sellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: 商家表
 */
@Component
public class sellerDao {
    @Autowired
    private sellerMapper sellerMapper;

    /**
     * 增
     */
    public int addSeller(seller seller) {
        return sellerMapper.addSeller(seller);
    }

    /**
     * 删
     */
    public int deleteSeller(Integer id) {
        return sellerMapper.deleteSeller(id);
    }

    /**
     * 改
     */
    public int updateSeller(Integer id, seller newseller) {
        return sellerMapper.updateSeller(id, newseller);
    }

    /**
     * 通过 id 查询单个用户信息
     */
    public seller selectSellerById(Integer id) {
        return sellerMapper.selectSellerById(id);
    }

    /**
     * 查询所有用户信息
     */
    public List<seller> selectSellerAll() {
        return sellerMapper.selectSellerAll();
    }
}
