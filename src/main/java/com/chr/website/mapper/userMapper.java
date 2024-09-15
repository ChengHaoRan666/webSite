package com.chr.website.mapper;

import com.chr.website.entity.user;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/13 - 15:49
 * @Description: 用户表
 */
@Component
public interface userMapper {
    /**
     * 增
     */
    int addUser(@Param("user") user user);

    /**
     * 删
     */
    int deleteUser(@Param("id") Integer id);

    /**
     * 改
     */
    int updateUser(@Param("id") Integer id, @Param("newUser") user newUser);

    /**
     * 通过 用户名 username 查询用户信息
     */
    List<user> selectUserByUsername(@Param("username") String username);

    /**
     * 通过 id 查询单个用户信息
     *
     * @param id
     * @return
     */
    user selectUserById(@Param("id") Integer id);

    /**
     * 查询所有用户信息
     *
     * @return
     */
    List<user> selectUserAll();
}
