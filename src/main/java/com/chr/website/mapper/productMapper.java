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
     * 查各分类数量
     */
    Integer getCount(@Param("CategoryID") Integer CategoryID);

    /**
     * 关键词，商品类别，价格区间，三个搜索条件可有可无进行搜索
     */
    List<product> search(@Param("keyword") String keyword,
                         @Param("CategoryId") Integer CategoryId,
                         @Param("min") Integer min,
                         @Param("max") Integer max);
}
