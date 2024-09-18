package com.chr.website.mapper;

import com.chr.website.entity.star;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 11:35
 * @Description: 收藏表
 */
@Component
public interface starMapper {
    /**
     * 增
     */
    int addStar(@Param("star") star star);

    /**
     * 删
     */
    int deleteStar(@Param("StarID") Integer StarID);

    /**
     * 改
     */
    int updateStar(@Param("StarID") Integer starID, @Param("star") star star);

    /**
     * 查
     */
    List<star> selectStar();

    /**
     * 获取用户收藏数量
     */
    Integer getNumber(Integer userId);
}
