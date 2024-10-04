package com.chr.website.controller;

import com.chr.website.entity.product;
import com.chr.website.service.Impl.loginServiceImpl;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.sellerServiceImpl;
import com.chr.website.service.Impl.shippingServiceImpl;
import com.chr.website.utils.loginUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @Author: 程浩然
 * @Create: 2024/9/24 - 17:22
 * @Description: 个人主页的操作
 */
@Controller
public class homepage {
    @Autowired
    private loginServiceImpl loginService;
    @Autowired
    private sellerServiceImpl sellerService;
    @Autowired
    private pageServiceImpl pageService;
    @Autowired
    private shippingServiceImpl shippingService;

    /**
     * 个人中心页面
     */
    @RequestMapping("/profile")
    public String profileShow() {
        return "personalHomepage";
    }


    /**
     * 修改个人信息
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyShow() {
        return "modifyInformation";
    }


    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(
            HttpSession session,
            @RequestParam("name") String name,
            @RequestParam("password") String password,
            @RequestParam("password2") String password2,
            @RequestParam("Verification_code") String inputVerificationCode,
            @RequestParam("emil") String emil,
            @RequestParam("phone") String phone
    ) {
        String codeTrue = loginUtil.getVerificationCode(phone);
        Integer i = loginService.ModifyInformation((Integer) session.getAttribute("userId"), name, password, password2, inputVerificationCode, codeTrue, emil, phone);
        switch (i) {
            case 0:
                return "login";
            case -1, -2, -3, -4:
                session.setAttribute("modifyEx", -i);
                return "modifyInformation";
        }
        return "modifyInformation";
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
     * 注册店铺
     */
    @RequestMapping(value = "/shoppingRegister", method = RequestMethod.GET)
    public String shoppingRegisterShow() {
        return "shoppingRegister";
    }


    @RequestMapping(value = "/shoppingRegister", method = RequestMethod.POST)
    public String shoppingRegister(
            HttpSession session,
            @RequestParam("name") String name,
            @RequestParam("brief") String brief
    ) {
        Integer i = sellerService.sellerRegister((Integer) session.getAttribute("userId"), name, brief);
        if (i == -4) {
            session.setAttribute("shoppingRegisterEx", -4);
            return "shoppingRegister";
        } else {
            loginOut(session);
            return "login";
        }
    }

    /**
     * 退出登录
     */
    @RequestMapping("/loginOff")
    public String loginOff(HttpSession session) {
        session.removeAttribute("userId");
        return "redirect:/";
    }


    /**
     * 注销账户
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        Integer id = (Integer) session.getAttribute("userId");
        session.removeAttribute("userId");
        loginService.logoff(id);
        return "redirect:/";
    }

    /**
     * 查看（购物车，订单，收藏，待收货）商品
     */
    @RequestMapping("/view")
    public String view(Model model, HttpSession session, @RequestParam("id") Integer id) {
        Integer userId = (Integer) session.getAttribute("userId");
        String[] tmp = new String[]{"订单", "收藏", "购物车", "待收货"};
        Map[] maps = new Map[]{pageService.orderShow(userId), pageService.collectShow((userId)), pageService.cartShow(userId), pageService.receivedShow(userId)};
        session.setAttribute("tableName", tmp[id - 1]);
        session.setAttribute("tableVal", maps[id - 1]);
        model.addAttribute("categoryMap", populateCategoryMap());
        return "personView";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete-item", method = RequestMethod.POST)
    public ResponseEntity<?> deleteItem(HttpSession session, @RequestBody Map<String, String> request) {
        Integer userId = (Integer) session.getAttribute("userId");
        Integer itemId = Integer.valueOf(request.get("itemId"));
        Integer tableName = Integer.valueOf(request.get("tableName"));
        switch (tableName) {
            case 1:
                shippingService.deleteOrderByUserIdProductId(userId, itemId);
                break;
            case 2:
                shippingService.deleteStarByUserIdProductId(userId, itemId);
                break;
            case 3:
                shippingService.deleteCarByUserIdProductId(userId, itemId);
                break;
        }
        return ResponseEntity.ok().body(Collections.singletonMap("message", "删除成功"));
    }

    /**
     * 加入购物车
     */
    @RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
    public ResponseEntity<?> addToCart(HttpSession session, @RequestBody Map<String, String> request) {
        Integer itemId = Integer.valueOf(request.get("itemId"));
        Integer userId = (Integer) session.getAttribute("userId");
        shippingService.addCart(userId, itemId, 1);
        return ResponseEntity.ok().body(Collections.singletonMap("message", "添加成功"));
    }

    /**
     * 结算
     */
    @RequestMapping(value = "/settle", method = RequestMethod.POST)
    public ResponseEntity<?> settle(HttpSession session, @RequestBody Map<String, Object> payload) {
        Integer userId = (Integer) session.getAttribute("userId");
        List<?> itemIdList = (List<?>) payload.get("itemIds");
        Set<Integer> settleSet = new HashSet<>();
        for (Object itemId : itemIdList) {
            settleSet.add(Integer.parseInt((String) itemId));
        }

        Map<product, Integer> settleMap = pageService.cartShow(userId);

        // 使用迭代器的remove方法来安全地删除元素
        settleMap.keySet().removeIf(product -> !settleSet.contains(product.getId()));

        // 将结算商品放入 session 域中
        session.setAttribute("settleMap", settleMap);
        return ResponseEntity.ok().body(Collections.singletonMap("message", "结算成功"));
    }

    /**
     * 确认收货
     */
    @RequestMapping(value = "/receipt", method = RequestMethod.POST)
    public ResponseEntity<?> receipt(HttpSession session, @RequestBody Map<String, Object> payload) {
        Integer userId = (Integer) session.getAttribute("userId");
        List<?> itemIdList = (List<?>) payload.get("itemIds");
        Set<Integer> receiptSet = new HashSet<>();
        for (Object itemId : itemIdList) {
            receiptSet.add(Integer.parseInt((String) itemId));
        }
        for (Integer itemId : receiptSet)
            shippingService.delivery(userId, itemId, "3");
        // 将待评价商品 id 加入 session 域中
        session.setAttribute("receiptSet", receiptSet);
        return ResponseEntity.ok().body(Collections.singletonMap("message", "确认收货成功"));
    }

    /**
     * 修改购物车商品数量
     */
    @RequestMapping(value = "/updateQuantity", method = RequestMethod.POST)
    public String updateQuantity(
            HttpSession session,
            @RequestParam("itemId") Integer productId,
            @RequestParam("quantity") Integer quantity) {
        Integer userId = (Integer) session.getAttribute("userId");
        // TODO 在cartDao中加上一个方法：通过 userId和 productId 删除 cart
        // TODO 删除 userId 的所有 productId

        // TODO 将新的商品 id 加入

        return "personView";
    }
}
