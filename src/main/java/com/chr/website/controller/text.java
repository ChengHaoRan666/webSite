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
PageInfo{
pageNum=1, 页码
pageSize=3, 每页最大数量
size=3, 当前页数量
startRow=1, 开始条数
endRow=3, 结束条数
total=12, 总记录数
pages=4, 总页数
list=Page{count=true, pageNum=1, pageSize=3, startRow=0, endRow=3, total=12, pages=4, reasonable=false, pageSizeZero=false}[review{reviewId=1, productId=1, userId=1, rating=5, comment='第一条评论', reviewTime=Sat Oct 12 17:27:30 CST 2024}, review{reviewId=2, productId=1, userId=1, rating=5, comment='第二条评论', reviewTime=Sat Oct 12 17:27:30 CST 2024}, review{reviewId=3, productId=1, userId=1, rating=5, comment='第三条评论', reviewTime=Sat Oct 12 17:27:30 CST 2024}], prePage=0, nextPage=2, isFirstPage=true, isLastPage=false, hasPreviousPage=false, hasNextPage=true, navigatePages=1, navigateFirstPage=1, navigateLastPage=1, navigatepageNums=[1]}
 */

/*

[
  {
    "review": {
      "reviewId": 4,
      "productId": 1,
      "userId": 1,
      "rating": 2,
      "comment": "第四条评论",
      "reviewTime": 1728725250000
    },
    "userName": "1"
  },
  {
    "review": {
      "reviewId": 5,
      "productId": 1,
      "userId": 1,
      "rating": 1,
      "comment": "第五条评论",
      "reviewTime": 1728725250000
    },
    "userName": "1"
  },
  {
    "review": {
      "reviewId": 6,
      "productId": 1,
      "userId": 1,
      "rating": 5,
      "comment": "第六条评论",
      "reviewTime": 1728725250000
    },
    "userName": "1"
  }
]
 */