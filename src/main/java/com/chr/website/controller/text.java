package com.chr.website.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class text {
    public static Map<String, String> getAttribute(String productDescription) {
        // 属性用；分割 其中商品类型是 key={val1,val2...}
        // 存储容量={12+128,16+256};3C认证={xxxxx};...
        String[] attributes = productDescription.split(";");
        Map<String, String> attributeMap = new HashMap<>();
        for (String attribute : attributes) {
            String[] tmp = attribute.split("=");
            // 将属性，类型放入Map
            attributeMap.put(tmp[0], tmp[1].substring(1, tmp[1].length() - 1));
        }
        return attributeMap;
    }

    public static void main(String[] args) {
        Map<String, String> attribute = getAttribute("存储容量={12+128,16+128,16+256};颜色={黑色,红色,白色};上市时间={2024-10-4};售后服务={全国联保};商品系列={xxx系列};是否支持无线充电={否};耳机插头类型={3.5mm耳机口};");
        System.out.println(attribute);
        Set<String> iterator = attribute.keySet();
        for (String a : iterator) {
            System.out.println(a + " " + attribute.get(a));
        }
    }
}
/*

存储容量={12+128,16+128,16+256};颜色={黑色,红色,白色};上市时间={2024-10-4};售后服务={全国联保};商品系列={xxx系列};是否支持无线充电={否};耳机插头类型={3.5mm耳机口};

 */