package com.change.achievement.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class GetMD5 {

	public static String getMD5String(String str) {
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算md5函数
            md.update(str.getBytes());
            String pass = new BigInteger(1, md.digest()).toString(16);
            return pass;
        } catch (Exception e) {
           String mes="加密失败";
           return mes;
        }
    }
}
