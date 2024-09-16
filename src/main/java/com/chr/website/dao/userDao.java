package com.chr.website.dao;

import com.chr.website.entity.user;
import com.chr.website.mapper.userMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 14:16
 * @Description: 用户表
 */
@Component
public class userDao {
    @Autowired
    private userMapper userMapper;

    /**
     * 增
     */
    public int addUser(user user) {
        return userMapper.addUser(user);
    }

    /**
     * 删
     */
    public int deleteUser(Integer id) {
        return userMapper.deleteUser(id);
    }

    /**
     * 改
     */
    public int updateUser(Integer id, user newUser) {
        return userMapper.updateUser(id, newUser);
    }

    /**
     * 通过 用户名 username 查询用户信息
     */
    public List<user> selectUserByUsername(String username) {
        return userMapper.selectUserByUsername(username);
    }

    /**
     * 通过 id 查询单个用户信息
     *
     * @param id
     * @return
     */
    public user selectUserById(Integer id) {
        return userMapper.selectUserById(id);
    }

    /**
     * 查询所有用户信息
     *
     * @return
     */
    public List<user> selectUserAll() {
        return userMapper.selectUserAll();
    }
}
