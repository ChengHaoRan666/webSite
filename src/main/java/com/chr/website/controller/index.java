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


    /**
     * 主页
     */
    @RequestMapping("/")
    public String index(HttpSession session, Model model) {
        // 获取收藏列表，购物车列表
        Map<product, Integer> starMap = pageService.collectShow((Integer) session.getAttribute("userId"));
        Map<product, Integer> cartMap = pageService.cartShow((Integer) session.getAttribute("userId"));
        // 获取四个种类的 新产品 商品列表
        List<product> newProducts1 = pageService.search(null, 1, null, null);
        List<product> newProducts2 = pageService.search(null, 2, null, null);
        List<product> newProducts3 = pageService.search(null, 3, null, null);
        List<product> newProducts4 = pageService.search(null, 4, null, null);
        // 获取四个种类的 总畅销榜单 商品列表
        List<product> TotalBestsellerProducts1 = pageService.search(null, 1, null, null);
        List<product> TotalBestsellerProducts2 = pageService.search(null, 2, null, null);
        List<product> TotalBestsellerProducts3 = pageService.search(null, 3, null, null);
        List<product> TotalBestsellerProducts4 = pageService.search(null, 4, null, null);

        // 加入 session 域中
        // 新商品榜单
        session.setAttribute("newProducts1", newProducts1);
        session.setAttribute("newProducts2", newProducts2);
        session.setAttribute("newProducts3", newProducts3);
        session.setAttribute("newProducts4", newProducts4);
        // 总商品畅销榜单
        session.setAttribute("TotalBestsellerProducts1", TotalBestsellerProducts1);
        session.setAttribute("TotalBestsellerProducts2", TotalBestsellerProducts2);
        session.setAttribute("TotalBestsellerProducts3", TotalBestsellerProducts3);
        session.setAttribute("TotalBestsellerProducts4", TotalBestsellerProducts4);
        // 购物车，收藏数量
        session.setAttribute("starCount", starMap.size());
        session.setAttribute("cartCount", cartMap.size());
        // 添加产品类别映射
        model.addAttribute("categoryMap", populateCategoryMap());
        return "index";
    }


    /**
     * 登录页面
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }


    /**
     * 购物车页面
     */
    @RequestMapping("/cartShow")
    public String cartShow() {
        return "cart";
    }

    /**
     * 收藏页面
     */
    @RequestMapping("/starShow")
    public String starShow() {
        return "star";
    }

    /**
     * 搜索结果页面
     */
    @RequestMapping("/search")
    public String search(
            @RequestParam(value = "keyWord", required = false) String keyWord,
            @RequestParam(value = "CategoryId", required = false) String CategoryId
    ) {
        System.out.println(keyWord + "  " + CategoryId);
        return "store";
    }


}