package com.chr.website.service.Impl;

import com.chr.website.dao.orderDao;
import com.chr.website.dao.productDao;
import com.chr.website.dao.sellerDao;
import com.chr.website.dao.userDao;
import com.chr.website.entity.order;
import com.chr.website.entity.product;
import com.chr.website.entity.seller;
import com.chr.website.entity.user;
import com.chr.website.service.sellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 16:00
 */
@Service
public class sellerServiceImpl implements sellerService {
    @Autowired
    private sellerDao sellerDao;
    @Autowired
    private userDao userDao;
    @Autowired
    private productDao productDao;
    @Autowired
    private orderDao orderDao;

    /**
     * 商家登录<br>
     * 成功登录  用户id<br>
     * 密码不对   -1<br>
     * 手机号格式错误  -2<br>
     * 验证码错误   -3<br>
     * 密码错误  -4<br>
     * 有空  -5<br>
     */
    public Integer sellerLogin(String username, String password1, String password2, String phone, String code, String codeTrue) {
        if (username.isEmpty() || password1.isEmpty() || password2.isEmpty() || phone.isEmpty() || code.isEmpty() || codeTrue.isEmpty()) {
            return -5;
        }
        // 两次密码不对
        if (!Objects.equals(password1, password2)) {
            return -1;
        }
        // 手机号位数不对
        if (phone.length() != 11) {
            return -2;
        }
        // 手机号包含其他字符
        for (int i = 0; i < phone.length(); i++) {
            if (phone.charAt(i) < '0' || phone.charAt(i) > '9') {
                return -2;
            }
        }
        if (!code.equals(codeTrue)) {
            return -3;
        }

        List<seller> sellers = sellerDao.selectSellerAll();
        for (seller seller : sellers) {
            if (username.equals(seller.getName()) && password1.equals(seller.getPassword())) {
                return seller.getId();
            }
        }
        return -4;
    }


    /**
     * 商家注册<br>
     * 两次密码不对  -1<br>
     * 手机号错误 -2<br>
     * 验证码错误 -3<br>
     * 店铺名重复 -4<br>
     * 成功注册  0<br>
     */
    @Override
    public Integer sellerRegister(Integer Id, String sellerName, String brief) {
        user user = userDao.selectUserById(Id);
        List<seller> sellers = sellerDao.selectSellerAll();
        for (seller seller : sellers) {
            if (seller.getName().equals(sellerName)) {
                return -4;
            }
        }
        sellerDao.addSeller(new seller(sellerName, user.getPassword(), brief, user.getEmail(), user.getPhone()));
        userDao.deleteUser(Id);
        return 0;
    }

    /**
     * 商家管理商品
     */
    @Override
    public List<product> manage(Integer sellerId) {
        return productDao.selectProductByProductStoreID(sellerId);
    }

    /**
     * 商家管理订单
     */
    @Override
    public List<order> orderManage(Integer sellerId) {
        return orderDao.selectOrderBySellerID(sellerId);
    }

    /**
     * 商家订单发货
     */
    @Override
    public void orderSend(Integer orderId) {
        orderDao.updateOrderStatus(orderId, "2");
    }


    /**
     * 修改商家信息<br>
     * 成功修改  0<br>
     * 密码不对   -1<br>
     * 手机号格式错误  -2<br>
     * 验证码错误   -3<br>
     * 密码错误  -4<br>
     * 有空  -5<br>
     */
    @Override
    public Integer sellerModifyInformation(Integer sellerId, String sellerName, String password1, String password2, String code, String codeTrue, String Description, String email, String phone) {
        if (sellerId == 0 || sellerName.isEmpty() || password1.isEmpty() || password2.isEmpty() || Description.isEmpty() || code.isEmpty() || codeTrue.isEmpty() || email.isEmpty() || phone.isEmpty()) {
            return -5;
        }
        // 两次密码不对
        if (!Objects.equals(password1, password2)) {
            return -1;
        }
        // 手机号位数不对
        if (phone.length() != 11) {
            return -2;
        }
        // 手机号包含其他字符
        for (int i = 0; i < phone.length(); i++) {
            if (phone.charAt(i) < '0' || phone.charAt(i) > '9') {
                return -2;
            }
        }
        if (!code.equals(codeTrue)) {
            return -3;
        }
        sellerDao.updateSeller(sellerId, new seller(sellerName, password1, Description, email, phone));
        return 0;
    }

    /**
     * 商家注销
     */
    @Override
    public Integer sellerLogoff(Integer sellerId) {
        return sellerDao.deleteSeller(sellerId);
    }
}
