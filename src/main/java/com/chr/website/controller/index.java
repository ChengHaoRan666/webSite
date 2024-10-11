package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:21
 * @Description: 首页
 */
@Controller
public class index {
    @Autowired
    private pageServiceImpl pageService;
    @Autowired
    private shippingServiceImpl shippingService;

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
     * 将 products 进行排序，获取前 n 名
     */
    private List<productAndRanting> sortByRantingAndSun(List<product> products, int n) {
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
        // 删除20名之后的
        if (productAndRantings.size() > n) productAndRantings.subList(n, productAndRantings.size()).clear();
        return productAndRantings;
    }

    /**
     * 主页
     */
    @RequestMapping("/")
    public String index(HttpServletResponse response, HttpSession session, Model model) {
        // 设置 Cookie 存活时间
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(60 * 60 * 24 * 7); // 设置Cookie有效期为7天
        cookie.setHttpOnly(true); // 提高安全性
        cookie.setSecure(true); // 如果使用HTTPS，则设置为true
        response.addCookie(cookie);


        // 获取收藏列表，购物车列表
        Map<product, Integer> starMap = pageService.collectShow((Integer) session.getAttribute("userId"));
        Map<product, Integer> cartMap = pageService.cartShow((Integer) session.getAttribute("userId"));

        // 获取四个种类的 新产品 商品列表（每个大小限制为40）
        List<product> newProducts1 = pageService.search(null, 1, null, null);
        List<product> newProducts2 = pageService.search(null, 2, null, null);
        List<product> newProducts3 = pageService.search(null, 3, null, null);
        List<product> newProducts4 = pageService.search(null, 4, null, null);
        // 进行排序，取前40
        newProducts1 = newProducts1.stream().sorted(Comparator.comparing(product::getListedDate).reversed()).limit(40).toList();
        newProducts2 = newProducts2.stream().sorted(Comparator.comparing(product::getListedDate).reversed()).limit(40).toList();
        newProducts3 = newProducts3.stream().sorted(Comparator.comparing(product::getListedDate).reversed()).limit(40).toList();
        newProducts4 = newProducts4.stream().sorted(Comparator.comparing(product::getListedDate).reversed()).limit(40).toList();

        // 获取商品列表总畅销榜单（每个大小限制为20）
        List<productAndRanting> productAndRantings = sortByRantingAndSun(pageService.indexShow(), 20);

        // 获取四个种类的 各个畅销榜单 商品列表（每个大小限制为30）
        List<product> BestsellerProducts1 = new ArrayList<>();
        for (productAndRanting productAndRanting : sortByRantingAndSun(pageService.search(null, 1, null, null), 30))
            BestsellerProducts1.add(productAndRanting.product);
        List<product> BestsellerProducts2 = new ArrayList<>();
        for (productAndRanting productAndRanting : sortByRantingAndSun(pageService.search(null, 2, null, null), 30))
            BestsellerProducts2.add(productAndRanting.product);
        List<product> BestsellerProducts3 = new ArrayList<>();
        for (productAndRanting productAndRanting : sortByRantingAndSun(pageService.search(null, 3, null, null), 30))
            BestsellerProducts3.add(productAndRanting.product);


        // 加入 session 域中
        // 新商品榜单
        session.setAttribute("newProducts1", newProducts1);
        session.setAttribute("newProducts2", newProducts2);
        session.setAttribute("newProducts3", newProducts3);
        session.setAttribute("newProducts4", newProducts4);
        // 总商品畅销榜单
        session.setAttribute("productAndRantings", productAndRantings);
        // 各个商品畅销榜单
        session.setAttribute("BestsellerProducts1", BestsellerProducts1);
        session.setAttribute("BestsellerProducts2", BestsellerProducts2);
        session.setAttribute("BestsellerProducts3", BestsellerProducts3);
        // 购物车，收藏数量
        session.setAttribute("starCount", starMap.size());
        session.setAttribute("cartCount", cartMap.size());
        // 收藏，购物车列表
        session.setAttribute("starMap", starMap);
        session.setAttribute("cartMap", cartMap);
        // 添加产品类别映射
        model.addAttribute("categoryMap", populateCategoryMap());
        return "index";
    }

    /**
     * 判断商品是否收藏了
     */
    @RequestMapping("/isStarred")
    public ResponseEntity<?> isProductStarred(@RequestParam("productId") Integer productId, HttpSession session) {
        // 调用服务层方法检查产品是否已被收藏
        boolean isStarred = pageService.collectShow((Integer) session.getAttribute("userId")).keySet().stream().anyMatch(product -> Objects.equals(product.getId(), productId));
        // 创建响应体
        Map<String, Boolean> response = new HashMap<>();
        response.put("isStarred", isStarred);
        // 返回响应
        return ResponseEntity.ok(response);
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

    /**
     * 商品添加收藏
     */
    @RequestMapping("/addStar")
    public ResponseEntity<String> addStar(@RequestParam("productId") Integer productId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        } else {
            shippingService.addStar(userId, productId, 1);
            return ResponseEntity.ok("成功");
        }
    }

    /**
     * 商品添加购物车
     */
    @RequestMapping("/addCart")
    public ResponseEntity<String> addCart(@RequestParam("productId") Integer productId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        } else {
            shippingService.addCart(userId, productId, 1);
            return ResponseEntity.ok("成功");
        }
    }


}