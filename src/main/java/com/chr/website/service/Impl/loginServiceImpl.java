package com.chr.website.service.Impl;

import com.chr.website.dao.userDao;
import com.chr.website.entity.user;
import com.chr.website.service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @Author: 程浩然
 * @Create: 2024/9/18 - 15:58
 */
@Service
public class loginServiceImpl implements loginService {
    @Autowired
    private userDao userDao;

    /**
     * 用户登录 <br>
     * 成功登录  用户id<br>
     * 密码不对   -1<br>
     * 手机号格式错误  -2<br>
     * 验证码错误   -3<br>
     * 密码错误  -4<br>
     */
    @Override
    public Integer login(String username, String password1, String password2, String phone, String code) {
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
        // 验证码错误 TODO
        if (code != "") {
            return -3;
        }
        List<user> users = userDao.selectUserAll();
        for (user user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password1)) {
                // 修改最后登录时间
                userDao.updateUser(user.getId(), new user(user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone(), user.getDate(), new Date()));
                return user.getId();
            }
        }
        return -4;
    }

    /**
     * 用户注册<br>
     * 成功注册 0<br>
     * 两次密码不对 -1 <br>
     * 手机号格式错误 -2<br>
     * 验证码错误 -3 <br>
     * 用户名重复  -4<br>
     */
    @Override
    public Integer register(String username, String password1, String password2, String code, String email, String phone) {
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
        // 验证码错误 TODO
        if (code != "") {
            return -3;
        }
        List<user> users = userDao.selectUserAll();
        for(user user:users){
            if(user.getUsername().equals(username)){
                return -4;
            }
        }
        userDao.addUser(new user(username, password1, email, phone, new Date(), null));
        return 0;
    }


    /**
     * 修改个人信息<br>
     * 成功修改 0<br>
     * 密码不对 -1 <br>
     * 手机号格式错误 -2<br>
     * 验证码错误 -3 <br>
     * 密码错误 -4<br>
     */
    @Override
    public Integer ModifyInformation(Integer id, String username, String password1, String password2, String code, String email, String phone) {
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
        // 验证码错误 TODO
        if (code != "") {
            return -3;
        }
        user user = userDao.selectUserById(id);
        userDao.updateUser(id, new user(username, password1, email, phone, user.getDate(), new Date()));
        return 0;
    }

    /**
     * 注销用户<br>
     * 成功返回 1 <br>
     * 失败返回 0 <br>
     */
    @Override
    public Integer logoff(Integer id) {
        try {
            userDao.deleteUser(id);
            return 0;
        } catch (Exception e) {
            return 0;
        }
    }

}

