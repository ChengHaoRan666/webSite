package com.chr.website.mapper;

import com.chr.website.entity.user;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/13 - 15:49
 * @Description: 对用户表的增删改查操作
 */
@Component
public interface userMapper {
    /**
     * 添加用户
     *
     * @param user 用户
     * @return 用户id
     */
    int addUser(@Param("user") user user);


    /**
     * 通过 id 删除用户
     *
     * @param id
     * @return 改变行数
     */
    int deleteUser(@Param("id") Integer id);

    /**
     * 通过 id 修改用户信息
     *
     * @param newUser
     * @return 改变行数
     */
    int updateUser(@Param("newUser") user newUser);

    /**
     * 通过 id 查询用户信息
     *
     * @param id
     * @return
     */
    user insertUserById(@Param("id") Integer id);

    /**
     * 查询所有用户信息
     *
     * @return
     */
    List<user> insertUserAll();
}
