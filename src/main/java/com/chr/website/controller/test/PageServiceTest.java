package com.chr.website.controller.test;

import com.chr.website.service.Impl.pageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageServiceTest {
    @Autowired
    private pageServiceImpl pageService;

    /**
     * 获取全部商品用于首页展示
     */
    @RequestMapping("PageServiceTest1")
    String  indexShow() {
        System.out.println(pageService.indexShow());
        return "index";
    }


    /**
     * 获取收藏的商品
     */
    @RequestMapping("PageServiceTest2")
    String  collectShow() {
        System.out.println(pageService.collectShow(1));
        return "index";
    }


    /**
     * 获取购物车中的商品
     */
    @RequestMapping("PageServiceTest3")
    String  cartShow() {
        System.out.println(pageService.cartShow(1));
        return "index";
    }


    /**
     * 获取订单中的商品
     */
    @RequestMapping("PageServiceTest4")
    String  orderShow() {
        System.out.println(pageService.orderShow(1));
        return "index";
    }


    /**
     * 查看订单中为收货的商品
     */
    @RequestMapping("PageServiceTest5")
    String  receivedShow() {
        System.out.println(pageService.receivedShow(1));
        return "index";
    }


    /**
     * 获取单个商品
     */
    @RequestMapping("PageServiceTest6")
    String  commodityShow() {
        System.out.println(pageService.commodityShow(1));
        return "index";
    }


    /**
     * 关键词，商品类别，价格区间，三个搜索条件可有可无进行搜索
     */
    @RequestMapping("PageServiceTest7")
    String  search() {
        System.out.println(pageService.search(null,null,null,null));
        return "index";
    }
}
