package com.chr.website.dao;

import com.chr.website.entity.review;
import com.chr.website.mapper.reviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: 评价表
 */
@Component
public class reviewDao implements reviewMapper {
    @Autowired
    private reviewMapper reviewMapper;

    /**
     * 增
     */
    public int addReview(review review) {
        return reviewMapper.addReview(review);
    }

    /**
     * 通过商品id查找
     */
    public List<review> selectReviewByproductId(Integer productId) {
        return reviewMapper.selectReviewByproductId(productId);
    }

    /**
     * 通过商品id删除
     */
    @Override
    public int deleteByproductId(Integer productId) {
        return reviewMapper.deleteByproductId(productId);
    }

}
