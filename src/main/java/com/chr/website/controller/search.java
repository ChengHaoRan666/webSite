package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.entity.review;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
import com.github.pagehelper.PageInfo;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @Author: 程浩然
 * @Create: 2024/9/21 - 19:04
 * @Description: 搜索页
 */
@Controller
public class search {
    @Autowired
    private shippingServiceImpl shippingService;
    @Autowired
    private pageServiceImpl pageService;


    /**
     * 查看单个商品详情页
     */
    @RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
    public String productShow(Model model, HttpSession session, @PathVariable(value = "productId", required = false) Integer productId) {
        @Data
        class reviewAndUserName {
            review review;
            String userName;

            public reviewAndUserName(review review, String userName) {
                this.review = review;
                this.userName = userName;
            }
        }

        @Data
        class productAndRanting {
            product product;
            Integer ranting;

            public productAndRanting(product product, Integer ranting) {
                this.product = product;
                this.ranting = ranting;
            }
        }


        // 更新收藏和购物车红点
        // 获取收藏列表，购物车列表
        Map<product, Integer> starMap = pageService.collectShow((Integer) session.getAttribute("userId"));
        Map<product, Integer> cartMap = pageService.cartShow((Integer) session.getAttribute("userId"));

        // 购物车数量
        session.setAttribute("starCount", starMap.size());
        // 收藏数量
        session.setAttribute("cartCount", cartMap.size());
        // 收藏，购物车列表
        session.setAttribute("starMap", starMap);
        session.setAttribute("cartMap", cartMap);


        // 相关推荐
        product product = pageService.commodityShow(productId); // 商品
        Integer categoryId = product.getCategoryId(); // 类型
        // 获取相同类型的商品
        List<product> productList = pageService.search(null, categoryId, null, null);
        Collections.shuffle(productList);
        productList.remove(product);
        List<product> products = productList.subList(0, 4);


        List<productAndRanting> productAndRantings = new ArrayList<>();
        for (product product1 : products)
            productAndRantings.add(new productAndRanting(product1, getRanting(product1.getId())));

        model.addAttribute("categoryMap", populateCategoryMap());
        session.setAttribute("product_recommend", productAndRantings);
        // 将商品放入域中
        model.addAttribute("search_product", product);
        // 商品平均评分
        model.addAttribute("search_product_ranting", getRanting(productId));
        // 获取参数信息
        Map<String, String> attributeMap = pageService.getAttribute(product.getDescription());
        String main = attributeMap.get("main");
        attributeMap.remove("main");
        // 获取主要展示信息
        model.addAttribute("attributeMain", main);
        // 将商品信息放入model中
        model.addAttribute("attributeMap", attributeMap);
        // 商品评分
        List<Integer> rating = pageService.getRating(productId);
        int[] ratingCount = new int[6];
        for (Integer tmp : rating) ratingCount[tmp]++;
        // 每个评分的占比
        model.addAttribute("ratingCount", ratingCount);
        // 所有评分的数量
        model.addAttribute("search_product_ranting_count", rating.size());
        // 获取商品评论,放入model中，将用户id换成用户名
        List<review> reviews = pageService.getComment(productId, 1);
        PageInfo<review> pageInfo = new PageInfo<>(reviews, 1);

        /*
        TODO
         */
        System.out.println("11111111111111111111111");
        System.out.println(pageInfo);

        // 通过评论中的用户id获得用户名进行展示
        List<reviewAndUserName> reviewAndUserNames = new ArrayList<>();
        for (review review : reviews)
            reviewAndUserNames.add(new reviewAndUserName(review, shippingService.getUserNameByUserId(review.getUserId())));
        model.addAttribute("reviewAndUserNameList", reviewAndUserNames);

        return "product";
    }


    /**
     * 产品类别映射
     */
    @ModelAttribute("categoryMap")
    public Map<Integer, String> populateCategoryMap() {
        Map<Integer, String> categoryMap = new HashMap<>();
        categoryMap.put(1, "电脑");
        categoryMap.put(2, "手机");
        categoryMap.put(3, "相机");
        categoryMap.put(4, "配件");
        return categoryMap;
    }


    /**
     * 获取商品的评分
     */
    public Integer getRanting(Integer productId) {
        List<Integer> ratings = pageService.getRating(productId);
        Integer rating = -1;
        if (!ratings.isEmpty()) {
            int size = ratings.size();
            int sun = ratings.stream().mapToInt(Integer::intValue).sum();
            rating = sun / size;
        }
        return rating;
    }

    /**
     * 搜索结果页面
     */
    @RequestMapping("/search")
    public String search(@RequestParam(value = "keyWord", required = false) String keyWord, @RequestParam(value = "CategoryId", required = false) String CategoryId, @RequestParam(value = "price_min", required = false) String price_min, @RequestParam(value = "price_max", required = false) String price_max) {
        System.out.println(keyWord + "  " + CategoryId + " " + price_max + " " + price_min);
        return "store";
    }
}
