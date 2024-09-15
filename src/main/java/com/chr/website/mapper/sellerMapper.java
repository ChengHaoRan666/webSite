package com.chr.website.mapper;

import com.chr.website.entity.seller;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/15 - 18:38
 * @Description: 商家表
 */
@Component
public interface sellerMapper {
    /**
     * 增
     */
    int addSeller(@Param("seller") seller seller);
    /**
     * 删
     */
    int deleteSeller(@Param("id") Integer id);
    /**
     * 改
     */
    int updateSeller(@Param("id") Integer id, @Param("newSeller") seller newseller);
    /**
     * 通过 id 查询单个用户信息
     */
    seller selectSellerById(@Param("id") Integer id);
    /**
     * 查询所有用户信息
     */
    List<seller> selectSellerAll();
}
