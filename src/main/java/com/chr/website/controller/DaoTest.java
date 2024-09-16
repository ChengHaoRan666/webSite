package com.chr.website.controller;

import com.chr.website.dao.*;
import com.chr.website.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/16 - 12:01
 * @Description: Dao 层掉用 Mapper接口测试
 */
@Controller
public class DaoTest {

    @Autowired
    private userDao userDao;
    @Autowired
    private sellerDao sellerDao;
    @Autowired
    private productDao productDao;
    @Autowired
    private orderDao orderDao;
    @Autowired
    private paymentDao paymentDao;
    @Autowired
    private reviewDao reviewDao;
    @Autowired
    private cartDao cartDao;
    @Autowired
    private starDao starDao;


    @RequestMapping("daoTest1")
    public String test1() {
        // 增
        userDao.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        userDao.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        userDao.addUser(new user("name1", "password1", "email1", "phone1", new Date(), new Date()));
        // 删
        userDao.deleteUser(3);
        // 改
        userDao.updateUser(2, new user("name2", "password2", "email2", "phone2", new Date(), new Date()));
        // 通过name查
        System.out.println(userDao.selectUserByUsername("name2"));
        // 通过 id 查
        System.out.println(userDao.selectUserById(2));
        // 查全部
        System.out.println(userDao.selectUserAll());
        return "index";
    }

    @RequestMapping("daoTest2")
    public String test2() {
        // 增
        sellerDao.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        sellerDao.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        sellerDao.addSeller(new seller("name1", "password1", "description1", "email1", "phone1"));
        // 删
        sellerDao.deleteSeller(3);
        // 改
        sellerDao.updateSeller(2, new seller("name2", "password2", "description2", "email2", "phone2"));
        // 查一个
        System.out.println(sellerDao.selectSellerById(2));
        // 查全部
        System.out.println(sellerDao.selectSellerAll());
        return "index";
    }


    @RequestMapping("daoTest3")
    public String test3() {
        // 增
        productDao.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        productDao.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        productDao.addProduct(new product("name1", 1, "描述1", 19.9, 100, 1, "www.url.com", new Date(), "0"));
        // 删
        productDao.deleteProduct(3);
        // 改
        productDao.updateProduct(2, new product("name2", 1, "描述2", 192.9, 120, 1, "www.url3.com", new Date(), "2"));
        // 查一个
        System.out.println(productDao.selectProductById(2));
        // 查全部
        System.out.println(productDao.selectProductAll());
        return "index";
    }

    @RequestMapping("daoTest4")
    public String test4() {
        // 增
        orderDao.addOrder(new order(1, 1, 1, 99.99, "deliveryAddress1", "recipientName1", "recipientPhone1", "1", new Date(), new Date(), new Date(), new Date()));
        orderDao.addOrder(new order(1, 1, 1, 19.99, "deliveryAddress2", "recipientName2", "recipientPhone2", "1", new Date(), new Date(), new Date(), new Date()));
        orderDao.addOrder(new order(1, 1, 1, 19.99, "deliveryAddress3", "recipientName3", "recipientPhone3", "1", new Date(), new Date(), new Date(), new Date()));
        // 删
        orderDao.deleteOrder(3);
        // 查一个
        System.out.println(orderDao.selectOrderById(1));
        // 查用户全部
        System.out.println(orderDao.selectOrderByUserId(1));
        // 查商家全部
        System.out.println(orderDao.selectOrderBySellerID(1));
        return "index";
    }

    @RequestMapping("daoTest5")
    public String test5() {
        // 增
        paymentDao.addPayment(new payment(1, 1, 19.9, "0", "0", new Date()));
        paymentDao.addPayment(new payment(1, 1, 29.9, "0", "0", new Date()));
        paymentDao.addPayment(new payment(1, 1, 39.9, "0", "0", new Date()));
        // 删
        paymentDao.deletePayment(3);
        // 查一个
        System.out.println(paymentDao.selectPaymentById(2));
        // 查用户全部
        System.out.println(paymentDao.selectPaymentByUserId(1));
        return "index";
    }


    @RequestMapping("daoTest6")
    public String test6() {
        // 增
        reviewDao.addReview(new review(1, 1, 5, "评论内容1", new Date()));
        reviewDao.addReview(new review(1, 1, 4, "评论内容2", new Date()));
        reviewDao.addReview(new review(1, 1, 3, "评论内容3", new Date()));
        reviewDao.addReview(new review(1, 1, 2, "评论内容4", new Date()));
        reviewDao.addReview(new review(1, 1, 1, "评论内容5", new Date()));
        // 查
        System.out.println(reviewDao.selectReviewByproductId(1));
        return "index";
    }


    @RequestMapping("daoTest7")
    public String test7() {
        // 增
        cartDao.addCart(new cart(1, 1, 1));
        cartDao.addCart(new cart(1, 1, 2));
        cartDao.addCart(new cart(1, 1, 3));
        cartDao.addCart(new cart(1, 1, 4));
        // 删
        cartDao.deleteCart(3);
        // 改
        cartDao.updateCart(2, new cart(1, 1, 5));
        // 查
        System.out.println(cartDao.selectCart());
        return "index";
    }

    @RequestMapping("daoTest8")
    public String test8() {
        // 增
        starDao.addStar(new star(1, 1, 1));
        starDao.addStar(new star(1, 1, 2));
        starDao.addStar(new star(1, 1, 3));
        starDao.addStar(new star(1, 1, 4));
        // 删
        starDao.deleteStar(3);
        // 改
        starDao.updateStar(2, new star(1, 1, 5));
        // 查
        System.out.println(starDao.selectStar());
        return "index";
    }
}
