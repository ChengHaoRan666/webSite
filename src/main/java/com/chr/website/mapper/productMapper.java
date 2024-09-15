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
}
