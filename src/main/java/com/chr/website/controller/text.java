package com.chr.website.controller;

/**
 * @Author: 程浩然
 * @Create: 2024/10/11 - 11:01
 * @Description:
 */
public class text {
    public static void main(String[] args) {
        String str1 = "(null, '商品";
        String str2 = "', 1, '描述";
        String str3 = "', 19.9, 100, ";
        String str4 = ", 'url', '2023-01-02', '1'),";
        for (int i = 2; i <= 400; i++)
            System.out.println(str1 + i + str2 + i + str3 + (i % 4 + 1) + str4);
    }
}
// (null, '商品2', 1, '描述1', 19.9, 100, 1, 'url1', '2023-01-02', '1');