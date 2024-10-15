package com.chr.website.controller;

public class test {
    public static void main(String[] args) {
        String a1 = "(null,1,1,";
        String a2 = ",'第";
        String a3 = "页评论，第";
        String a4 = "条评论','2024-10-14'),";
        int rating = 5;
        int page = 1;
        int strip = 1;
        for (int i = 0; i < 123; i++, rating--, strip++) {
            if (rating == 0) rating = 5;
            if (i != 0 && i % 3 == 0) page++;
            strip %= 3;
            if (strip == 0) strip = 3;
            System.out.println(a1 + rating + a2 + page + a3 + strip + a4);
        }
    }
}
