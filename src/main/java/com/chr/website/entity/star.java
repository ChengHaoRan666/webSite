package com.chr.website.entity;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 11:01
 * @Description: 收藏表
 */
public class star {
    private Integer StarID;
    private Integer UserID;
    private Integer ProductID;
    private Integer Quantity;

    public star() {
    }

    public star(Integer userID, Integer productID, Integer quantity) {
        UserID = userID;
        ProductID = productID;
        Quantity = quantity;
    }

    @Override
    public String toString() {
        return "star{" +
                "StarID=" + StarID +
                ", UserID=" + UserID +
                ", ProductID=" + ProductID +
                ", Quantity=" + Quantity +
                '}';
    }
}
