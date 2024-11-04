package com.chr.website.controller;

import com.chr.website.entity.order;
import com.chr.website.entity.product;
import com.chr.website.service.Impl.sellerServiceImpl;
import com.chr.website.utils.loginUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/10/27 - 16:36
 * @Description: 用于商家的操作
 */
@Controller
public class sellerManage {
    @Autowired
    private sellerServiceImpl sellerService;

    /**
     * 商家页面
     */
    @RequestMapping("/seller/sellerProfile")
    public String sellerShow() {
        return "merchantHomepage";
    }

    /**
     * 修改店铺信息
     */
    @RequestMapping(value = "/seller/sellerModify", method = RequestMethod.GET)
    public String sellerModify() {
        return "merchantModifyInformation";
    }

    @RequestMapping(value = "/seller/sellerModify", method = RequestMethod.POST)
    public String sellerModify2(
            HttpSession session,
            @RequestParam("name") String name,
            @RequestParam("password") String password,
            @RequestParam("password2") String password2,
            @RequestParam("Verification_code") String inputVerificationCode,
            @RequestParam("emil") String emil,
            @RequestParam("phone") String phone,
            @RequestParam("description") String description
    ) {
        Integer sellerId = (Integer) session.getAttribute("sellerId");
        String codeTrue = loginUtil.getVerificationCode(phone);
        Integer i = sellerService.sellerModifyInformation(sellerId, name, password, password2, inputVerificationCode, codeTrue, description, emil, phone);
        switch (i) {
            case 0:
                session.setAttribute("sellerName", name);
                return "login";
            case -1, -2, -3, -4:
                session.setAttribute("modifyEx", -i);
                return "merchantModifyInformation";
        }
        return "merchantModifyInformation";
    }


    /**
     * 商家注销
     */
    @RequestMapping("/seller/sellerLogoff")
    public String sellerLogoff(HttpSession session) {
        Integer sellerId = (Integer) session.getAttribute("sellerId");
        session.removeAttribute("sellerId");
        session.removeAttribute("sellerName");
        sellerService.sellerLogoff(sellerId);
        return "redirect:/";
    }


    /**
     * TODO 订单管理
     */
    @RequestMapping(value = "/seller/orderManage", method = RequestMethod.GET)
    public String orderManage(HttpSession session) {
        Integer sellerId = (Integer) session.getAttribute("sellerId");
        List<order> orders = sellerService.orderManage(sellerId);
    }

    /**
     * TODO 商品管理
     */
    @RequestMapping(value = "/seller/productManage", method = RequestMethod.GET)
    public String productManage(HttpSession session) {
        Integer sellerId = (Integer) session.getAttribute("sellerId");
        List<product> products = sellerService.manage(sellerId);

    }
}
