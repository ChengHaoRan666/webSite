package com.chr.website.dao;

import com.chr.website.entity.star;
import com.chr.website.mapper.starMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: 收藏表
 */
@Component
public class starDao implements starMapper {

    @Autowired
    private starMapper starMapper;

    /**
     * 增
     */
    public int addStar(star star) {
        return starMapper.addStar(star);
    }

    /**
     * 删
     */
    public int deleteStar(Integer StarID) {
        return starMapper.deleteStar(StarID);
    }

    /**
     * 改
     */
    public int updateStar(Integer starID, star star) {
        return starMapper.updateStar(starID, star);
    }

    /**
     * 查
     */
    public List<star> selectStar(Integer userId) {
        return starMapper.selectStar(userId);
    }

    /**
     * 获取用户订单数量
     */
    public Integer getNumber(Integer userId) {
        return starMapper.getNumber(1);
    }
}
