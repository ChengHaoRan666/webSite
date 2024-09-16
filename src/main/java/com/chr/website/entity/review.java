package com.chr.website.entity;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 10:02
 * @Description: 评价表
 */
public class review {
    private Integer reviewId;
    private Integer productId;
    private Integer userId;
    private Integer rating;
    private String comment;
    private Date reviewTime;

    public review() {
    }

    public review(Integer productId, Integer userId, Integer rating, String comment, Date reviewTime) {
        this.productId = productId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.reviewTime = reviewTime;
    }

    @Override
    public String toString() {
        return "review{" +
                "reviewId=" + reviewId +
                ", productId=" + productId +
                ", userId=" + userId +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", reviewTime=" + reviewTime +
                '}';
    }
}
