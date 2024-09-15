package com.chr.website.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * @Author: 程浩然
 * @Create: 2024/9/15 - 18:33
 * @Description: 商家类
 */
@Data
@Component
public class seller {
    Integer id;
    String name;
    String password;
    String Description;
    String email;
    String phone;

    public seller() {
    }

    public seller(Integer id, String name, String password, String description, String email, String phone) {
        this.id = id;
        this.name = name;
        this.password = password;
        Description = description;
        this.email = email;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "seller{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", Description='" + Description + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
