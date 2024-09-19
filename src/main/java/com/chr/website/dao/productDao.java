package com.chr.website.dao;

import com.chr.website.entity.product;
import com.chr.website.mapper.productMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: 商品表
 */
@Component
public class productDao implements productMapper {
    @Autowired
    private productMapper productMapper;

    /**
     * 增
     */
    public int addProduct(product product) {
        return productMapper.addProduct(product);
    }

    /**
     * 删
     */
    public int deleteProduct(Integer id) {
        return productMapper.deleteProduct(id);
    }

    /**
     * 改
     */
    public int updateProduct(Integer id, product product) {
        return productMapper.updateProduct(id, product);
    }

    /**
     * 查一个
     */
    public product selectProductById(Integer id) {
        return productMapper.selectProductById(id);
    }

    /**
     * 根据商家id查询商品
     */
    public List<product> selectProductByProductStoreID(@Param("ProductStoreID") Integer ProductStoreID) {
        return productMapper.selectProductByProductStoreID(ProductStoreID);
    }


    /**
     * 查全部
     */
    public List<product> selectProductAll() {
        return productMapper.selectProductAll();
    }

    /**
     * 查各分类数量
     */
    public Integer getCount(Integer CategoryID) {
        return productMapper.getCount(CategoryID);
    }

    /**
     * 关键词，商品类别，价格区间，三个搜索条件可有可无进行搜索
     */
    public List<product> search(String keyword, Integer CategoryId, Integer min, Integer max) {
        return productMapper.search(keyword, CategoryId, min, max);
    }
}
