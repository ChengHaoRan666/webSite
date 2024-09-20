package com.chr.website.controller.test;

import com.chr.website.entity.*;
import com.chr.website.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 12:01
 * @Description: Mapper 接口测试
 */
@Controller
public class MapperTest {

    @Autowired
    private userMapper userMapper;
    @Autowired
    private sellerMapper sellerMapper;
    @Autowired
    private productMapper productMapper;
    @Autowired
    private orderMapper orderMapper;
    @Autowired
    private reviewMapper reviewMapper;
    @Autowired
    private cartMapper cartMapper;
    @Autowired
    private starMapper starMapper;


    @RequestMapping("/test1")
    public String test1() {
        // 增
        userMapper.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        userMapper.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        userMapper.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        // 删
        userMapper.deleteUser(3);
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
        sellerMapper.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        // 删
        sellerMapper.deleteSeller(3);
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
        productMapper.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        // 删
        productMapper.deleteProduct(3);
        // 改
        productMapper.updateProduct(2, new product("name2", 1, "描述2", 192.9, 120, 1, "www.url3.com", new Date(), "2"));
        // 查一个
        System.out.println(productMapper.selectProductById(2));
        // 查全部
        System.out.println(productMapper.selectProductAll());
        // 查各分类数量
        System.out.println("分类数量" + productMapper.getCount(1));
        return "index";
    }

    @RequestMapping("/test4")
    public String test4() {
        // 增
        orderMapper.addOrder(new order(1, 1, 1, 99.99, "deliveryAddress1", "recipientName1", "recipientPhone1", "1", new Date(), new Date(), new Date(), new Date()));
        orderMapper.addOrder(new order(1, 1, 1, 19.99, "deliveryAddress2", "recipientName2", "recipientPhone2", "1", new Date(), new Date(), new Date(), new Date()));
        orderMapper.addOrder(new order(1, 1, 1, 19.99, "deliveryAddress3", "recipientName3", "recipientPhone3", "1", new Date(), new Date(), new Date(), new Date()));
        // 删
        orderMapper.deleteOrder(3);
        // 查一个
        System.out.println(orderMapper.selectOrderById(1));
        // 查用户全部
        System.out.println(orderMapper.selectOrderByUserId(1));
        // 查商家全部
        System.out.println(orderMapper.selectOrderBySellerID(1));
        // 查数量
        System.out.println("数量为：" + orderMapper.getNumber(1));
        return "index";
    }




    @RequestMapping("/test6")
    public String test6() {
        // 增
        reviewMapper.addReview(new review(1, 1, 5, "评论内容1", new Date()));
        reviewMapper.addReview(new review(1, 1, 4, "评论内容2", new Date()));
        reviewMapper.addReview(new review(1, 1, 3, "评论内容3", new Date()));
        reviewMapper.addReview(new review(1, 1, 2, "评论内容4", new Date()));
        reviewMapper.addReview(new review(1, 1, 1, "评论内容5", new Date()));
        // 查一个
        System.out.println(reviewMapper.selectReviewByproductId(1));
        return "index";
    }


    @RequestMapping("/test7")
    public String test7() {
        // 增
        cartMapper.addCart(new cart(1, 1, 1));
        cartMapper.addCart(new cart(1, 1, 2));
        cartMapper.addCart(new cart(1, 1, 3));
        cartMapper.addCart(new cart(1, 1, 4));
        // 删
        cartMapper.deleteCart(3);
        // 改
        cartMapper.updateCart(2, new cart(1, 1, 5));
        // 查
        System.out.println(cartMapper.selectCart(1));
        return "index";
    }

    @RequestMapping("/test8")
    public String test8() {
        // 增
        starMapper.addStar(new star(1, 1, 1));
        starMapper.addStar(new star(1, 1, 2));
        starMapper.addStar(new star(1, 1, 3));
        starMapper.addStar(new star(1, 1, 4));
        // 删
        starMapper.deleteStar(3);
        // 改
        starMapper.updateStar(2, new star(1, 1, 5));
        // 查
        System.out.println(starMapper.selectStar(1));
        // 查用户收藏数量
        System.out.println(starMapper.getNumber(1));
        return "index";
    }
}
