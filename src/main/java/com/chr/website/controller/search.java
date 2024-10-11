package com.chr.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author: 程浩然
 * @Create: 2024/9/21 - 19:04
 * @Description: 搜索页
 */
@Controller
public class search {
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
            @PathVariable(value = "productId", required = false) String productId
    ) {
        return "product";
    }
}
