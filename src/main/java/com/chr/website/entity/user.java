package com.chr.website.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 16:09
 * @Description:
 */

@Component
@Data
public class user {
    private String username;
    private String password;

    public user() {
    }

    public user(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return "user{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
