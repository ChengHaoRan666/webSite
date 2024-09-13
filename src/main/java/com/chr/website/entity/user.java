package com.chr.website.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: 程浩然
 * @Create: 2024/9/13 - 15:47
 * @Description: 用户类
 */
@Data
@Component
public class user {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private Date date;
    private Date lestDate;

    public user() {
    }

    public user(String username, String password, String email, String phone, Date date, Date lestDate) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.date = date;
        this.lestDate = lestDate;
    }

    @Override
    public String toString() {
        return "user{" +
                "Id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", date=" + date +
                ", lestDate=" + lestDate +
                '}';
    }
}
