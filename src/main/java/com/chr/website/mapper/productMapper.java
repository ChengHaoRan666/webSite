package com.chr.website.mapper;

import com.chr.website.entity.product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/15 - 19:42
 * @Description: 商品表
 */
@Component
public interface productMapper {
    /**
     * 增
     */
    int addProduct(@Param("product") product product);

    /**
     * 删
     */
    int deleteProduct(@Param("id") Integer id);

    /**
     * 改
     */
    int updateProduct(@Param("id") Integer id, @Param("product") product product);

    /**
     * 查一个
     */
    product selectProductById(@Param("id") Integer id);

    /**
     * 查全部
     */
    List<product> selectProductAll();

    /**
     * 查价格区间
     */
    List<product> selectProductByPrice(@Param("max") Double max, @Param("min") Double min);

    /**
     * 查各分类数量
     */
    Integer getCount(@Param("CategoryID") Integer CategoryID);

    /**
     * 根据分类和价格区间搜索
     */
    List<product> selectProductByPriceAndCategoryID(@Param("CategoryID") Integer CategoryID, @Param("max") Double max, @Param("min") Double min);

    /**
     * 根据类别搜索
     */
    List<product> selectProductByCategoryID(@Param("CategoryID") Integer CategoryID);
}
