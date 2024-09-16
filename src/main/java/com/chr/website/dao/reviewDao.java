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
public class reviewDao {
    @Autowired
    private reviewMapper reviewmapper;

    /**
     * 增
     */
    public int addReview(review review) {
        return reviewmapper.addReview(review);
    }

    /**
     * 通过商品id查找
     */
    public List<review> selectReviewByproductId(Integer productId) {
        return reviewmapper.selectReviewByproductId(productId);
    }

}
