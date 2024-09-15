package com.chr.website.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/15 - 19:28
 * @Description: 商品
 */
@Component
public class product {
    private Integer id;
    private String name;
    private Integer productStoreID;
    private String description;
    private Double price;
    private Integer stockQuantity;
    private Integer categoryId;
    private String imageUrl;
    private Date listedDate;
    private String status;

    public product() {
    }

    public product(String name, Integer productStoreID, String description, Double price, Integer stockQuantity, Integer categoryId, String imageUrl, Date listedDate, String status) {
        this.name = name;
        this.productStoreID = productStoreID;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.listedDate = listedDate;
        this.status = status;
    }

    @Override
    public String toString() {
        return "product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", productStoreID='" + productStoreID + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", stockQuantity=" + stockQuantity +
                ", categoryId=" + categoryId +
                ", imageUrl='" + imageUrl + '\'' +
                ", listedDate=" + listedDate +
                ", status=" + status +
                '}';
    }
}
