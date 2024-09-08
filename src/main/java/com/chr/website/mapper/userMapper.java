package com.chr.website.mapper;

import com.chr.website.entity.user;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 16:11
 * @Description:
 */
@Mapper
public interface userMapper {
    List<user> getAll();

}
