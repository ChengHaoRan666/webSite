package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.entity.seller;
import com.chr.website.entity.user;
import com.chr.website.mapper.productMapper;
import com.chr.website.mapper.sellerMapper;
import com.chr.website.mapper.userMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {

    @Autowired
    private userMapper userMapper;
    @Autowired
    private sellerMapper sellerMapper;
    @Autowired
    private productMapper productMapper;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/test1")
    public String test1() {
        // 增
        userMapper.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        userMapper.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        // 删
        userMapper.deleteUser(1);
        // 改
        userMapper.updateUser(2, new user("name2", "password2", "email2", "phone2", new Date(), new Date()));
        // 通过name查
        System.out.println(userMapper.selectUserByUsername("name2"));
        // 通过 id 查
        System.out.println(userMapper.selectUserById(2));
        // 查全部
        System.out.println(userMapper.selectUserAll());
        return "index";
    }

    @RequestMapping("/test2")
    public String test2() {
        // 增
        sellerMapper.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        sellerMapper.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        // 删
        sellerMapper.deleteSeller(1);
        // 改
        sellerMapper.updateSeller(2, new seller("name2", "password2", "description2", "email2", "phone2"));
        // 查一个
        System.out.println(sellerMapper.selectSellerById(2));
        // 查全部
        System.out.println(sellerMapper.selectSellerAll());
        return "index";
    }


    @RequestMapping("/test3")
    public String test3() {
        // 增
        productMapper.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        productMapper.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        // 删
        productMapper.deleteProduct(1);
        // 改
        productMapper.updateProduct(2, new product("name2", 1, "描述2", 192.9, 120, 1, "www.url3.com", new Date(), "2"));
        // 查一个
        System.out.println(productMapper.selectProductById(2));
        // 查全部
        System.out.println(productMapper.selectProductAll());
        return "index";
    }
}
