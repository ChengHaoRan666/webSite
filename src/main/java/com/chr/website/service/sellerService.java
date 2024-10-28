package com.chr.website.service;

import com.chr.website.entity.order;
import com.chr.website.entity.product;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 10:28
 * @Description: 商家的操作<br>
 * 登录，注册，管理商品
 */
@Service
public interface sellerService {
    /**
     * 商家登录
     */
    Integer sellerLogin(String username, String password1, String password2, String phone, String code,String codeTrue);

    /**
     * 商家注册
     */
    Integer sellerRegister(Integer Id, String sellerName, String brief);

    /**
     * 商家管理商品
     */
    List<product> manage(Integer sellerId);

    /**
     * 商家管理订单
     */
    List<order> orderManage(Integer sellerId);

    /**
     * 修改商家信息
     */
    Integer sellerModifyInformation(Integer sellerId, String sellerName, String password1, String password2, String code,String codeTrue, String Description, String email, String phone);

    /**
     * 商家注销
     */
    void sellerLogoff(Integer sellerId);
}
