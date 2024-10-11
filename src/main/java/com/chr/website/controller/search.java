package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
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
     * 搜索结果页面
     */
    @RequestMapping("/search")
    public String search(
            @RequestParam(value = "keyWord", required = false) String keyWord,
            @RequestParam(value = "CategoryId", required = false) String CategoryId,
            @RequestParam(value = "price_min", required = false) String price_min,
            @RequestParam(value = "price_max", required = false) String price_max
    ) {
        System.out.println(keyWord + "  " + CategoryId + " " + price_max + " " + price_min);
        return "store";
    }

    /**
     * 查看单个商品详情页
     */
    @RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
    public String productShow(
            Model model,
            HttpSession session,
            @PathVariable(value = "productId", required = false) Integer productId
    ) {

        @Data
        class productAndRanting {
            product product;
            Integer ranting;

            public productAndRanting(product product, Integer ranting) {
                this.product = product;
                this.ranting = ranting;
            }
        }

        product product = pageService.commodityShow(productId); // 商品
        Integer categoryId = product.getCategoryId(); // 类型
        // 获取相同类型的商品
        List<product> productList = pageService.search(null, categoryId, null, null);
        Collections.shuffle(productList);
        productList.remove(product);
        List<product> products = productList.subList(0, 4);


        List<productAndRanting> productAndRantings = new ArrayList<>();
        for (product product1 : products) {
            List<Integer> ratings = pageService.getRating(product1.getId());
            Integer rating = -1;
            if (!ratings.isEmpty()) {
                int size = ratings.size();
                int sun = ratings.stream().mapToInt(Integer::intValue).sum();
                rating = sun / size;
            }
            productAndRantings.add(new productAndRanting(product1, rating));
        }
        model.addAttribute("categoryMap", populateCategoryMap());
        session.setAttribute("product_recommend", productAndRantings);
        System.out.println(productAndRantings);
        System.out.println("1111111111111111111111111111111111111");
        return "product";
    }
}
