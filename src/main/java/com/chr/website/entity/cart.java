package com.chr.website.entity;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 11:01
 * @Description: 购物车
 */
public class cart {
    private Integer CartID;
    private Integer UserID;
    private Integer ProductID;
    private Integer Quantity;

    public cart() {
    }

    public cart(Integer userID, Integer productID, Integer quantity) {
        UserID = userID;
        ProductID = productID;
        Quantity = quantity;
    }

    @Override
    public String toString() {
        return "cart{" +
                "CartID=" + CartID +
                ", UserID=" + UserID +
                ", ProductID=" + ProductID +
                ", Quantity=" + Quantity +
                '}';
    }
}
