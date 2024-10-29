package com.chr.website.mapper;

import com.chr.website.entity.review;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 10:07
 * @Description: 评价表
 */
@Component
public interface reviewMapper {
    /**
     * 增
     */
    int addReview(@Param("review") review review);

    /**
     * 通过商品id查找
     */
    List<review> selectReviewByproductId(@Param("productId") Integer productId);

    /**
     * 通过商品id删除
     */
    int deleteByproductId(@Param("productId") Integer productId);
}
