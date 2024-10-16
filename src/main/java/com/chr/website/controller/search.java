package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.entity.review;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
import com.github.pagehelper.PageInfo;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @Data
    class reviewAndUserName {
        review review;
        String userName;

        public reviewAndUserName(review review, String userName) {
            this.review = review;
            this.userName = userName;
        }
    }

    /**
     * 将获取的评论中的userid换成username
     */
    List<reviewAndUserName> getReviewAndUserName(List<review> reviewList) {
        List<reviewAndUserName> reviewAndUserNames = new ArrayList<>();
        for (review review : reviewList)
            reviewAndUserNames.add(new reviewAndUserName(review, shippingService.getUserNameByUserId(review.getUserId())));
        return reviewAndUserNames;
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
     * 查看单个商品详情页
     */
    @RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
    public String productShow(Model model, HttpSession session, @PathVariable(value = "productId", required = false) Integer productId) {


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
        List<product> productList = pageService.search(null, categoryId, null, null, null);
        Collections.shuffle(productList);
        productList.remove(product);
        List<product> products = productList.subList(0, 4);

        List<productAndRanting> productAndRantings = new ArrayList<>();
        for (product product1 : products)
            productAndRantings.add(new productAndRanting(product1, getRanting(product1.getId())));

        model.addAttribute("categoryMap", populateCategoryMap());
        model.addAttribute("product_recommend", productAndRantings);
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
        // 当前页
        model.addAttribute("currentPage", pageInfo.getPageNum());
        // 总页数
        model.addAttribute("maxPage", pageInfo.getPages());
        // 总条数
        model.addAttribute("reviewCount", pageInfo.getTotal());
        // 商品id
        model.addAttribute("productId", productId);
        // 通过评论中的用户id获得用户名进行展示
        model.addAttribute("reviewAndUserNameList", getReviewAndUserName(reviews));

        return "product";
    }


    @RequestMapping(value = "/comments", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> getReviewsByPage(
            @RequestParam("productId") Integer productId,
            @RequestParam("page") Integer page) {
        List<review> reviews = pageService.getComment(productId, page);
        List<reviewAndUserName> reviewAndUserNameList = getReviewAndUserName(reviews);
        PageInfo<review> pageInfo = new PageInfo<>(reviews, page);

        Map<String, Object> response = new HashMap<>();
        response.put("reviewAndUserNameList", reviewAndUserNameList);
        response.put("currentPage", pageInfo.getPageNum());
        response.put("maxPage", pageInfo.getPages());

        return ResponseEntity.ok(response);
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

    private List<product> sortByRantingAndSun(List<product> products) {
        List<productAndRanting> productAndRantings = new ArrayList<>();
        for (product product : products) {
            List<Integer> ratings = pageService.getRating(product.getId());
            Integer rating = -1;
            if (!ratings.isEmpty()) {
                int size = ratings.size();
                int sun = ratings.stream().mapToInt(Integer::intValue).sum();
                rating = sun / size;
            }
            productAndRantings.add(new productAndRanting(product, rating));
        }
        productAndRantings.sort((o1, o2) -> o2.ranting - o1.ranting);
        List<product> products1 = new ArrayList<>();
        for (productAndRanting productAndRanting : productAndRantings) {
            products1.add(productAndRanting.getProduct());
        }
        return products1;
    }

    /**
     * 搜索结果页面
     */
    @RequestMapping("/search")
    public String search(
            Model model,
            HttpSession session,
            @RequestParam(value = "keyWord", required = false) String keyWord, // 关键词，必须在商品名中
            @RequestParam(value = "CategoryId", required = false) String CategoryIdString,
            @RequestParam(value = "pageNumber", required = false) String pageNumberString,
            @RequestParam(value = "price_min", required = false) String price_min_string,
            @RequestParam(value = "price_max", required = false) String price_max_string) {
        Integer CategoryId = CategoryIdString == null ? null : Integer.parseInt(CategoryIdString);
        Integer pageNumber = pageNumberString == null ? 1 : Integer.parseInt(pageNumberString);
        Double price_min = price_min_string == null ? null : Double.parseDouble(price_min_string);
        Double price_max = price_max_string == null ? null : Double.parseDouble(price_max_string);
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

        //向model中加入List<product> 搜索结果
        CategoryId--;
        List<product> searchProductList = new ArrayList<>();
        // 如果选择的是热销
        if (CategoryId == 0) {
            searchProductList = pageService.search(keyWord, null, price_min, price_max, pageNumber);
            model.addAttribute("searchProductList", sortByRantingAndSun(searchProductList));

        }
        // 如果选择的是全部
        else if (CategoryId == -1) {
           searchProductList = pageService.search(keyWord, null, price_min, price_max, pageNumber);
            model.addAttribute("searchProductList", searchProductList);
        }
        // 如果选择的是分类
        else {
             searchProductList = pageService.search(keyWord, CategoryId, price_min, price_max, pageNumber);
            model.addAttribute("searchProductList", searchProductList);
        }
        PageInfo<product> productPageInfo = new PageInfo<>(searchProductList, pageNumber);
        // 当前页
        model.addAttribute("currentPage", productPageInfo.getPageNum());
        // 总页数
        model.addAttribute("maxPage", productPageInfo.getPages());
        // 总条数
        model.addAttribute("reviewCount", productPageInfo.getTotal());
        return "store";
    }

    /**
     * 内部类，商品和它的评分
     */
    @Data
    private class productAndRanting {
        product product;
        Integer ranting;

        public productAndRanting(product product, Integer ranting) {
            this.product = product;
            this.ranting = ranting;
        }
    }
}
