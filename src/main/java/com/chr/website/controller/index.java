package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.service.Impl.pageServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {
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

    @RequestMapping("/")
    public String index(HttpSession session, Model model) {
        Map<product, Integer> starMap = pageService.collectShow((Integer) session.getAttribute("userId"));
        Map<product, Integer> cartMap = pageService.cartShow((Integer) session.getAttribute("userId"));
        session.setAttribute("starCount", starMap.size());
        session.setAttribute("cartCount", cartMap.size());
        List<product> products = pageService.indexShow();
        session.setAttribute("products", products);
        model.addAttribute("categoryMap", populateCategoryMap());
        return "index";
    }


    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/starShow")
    public String starShow() {
        return "star";
    }

    @RequestMapping("/cartShow")
    public String cartShow() {
        return "cart";
    }

    @RequestMapping("/search")
    public String search(
            @RequestParam(value = "keyWord", required = false) String keyWord,
            @RequestParam(value = "CategoryId", required = false) String CategoryId
    ) {
        System.out.println(keyWord + "  " + CategoryId);
        return "store";
    }


}