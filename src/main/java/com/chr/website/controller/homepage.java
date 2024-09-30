package com.chr.website.controller;

import com.chr.website.service.Impl.loginServiceImpl;
import com.chr.website.service.Impl.pageServiceImpl;
import com.chr.website.service.Impl.sellerServiceImpl;
import com.chr.website.utils.loginUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 程浩然
 * @Create: 2024/9/24 - 17:22
 * @Description: 主页的操作
 */
@Controller
public class homepage {
    @Autowired
    private loginServiceImpl loginService;
    @Autowired
    private sellerServiceImpl sellerService;
    @Autowired
    private pageServiceImpl pageService;

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

    /*
     * TODO 查看（购物车，订单，收藏，待收货）商品
     * TODO 照片
     * TODO 收藏不需要数量，总价，查看，删除功能
     * TODO 批量操作（加购物车，删除）
     * TODO 购物车 批量操作（结账）
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
}
