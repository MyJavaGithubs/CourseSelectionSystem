package com.fidofi.utils;

/**
 * Created by fido on 2017/12/26.
 * 截取学生学号后六位做为密码
 */
public class StuPasswordUtils {

    public static String getPassword(String studentId){

        return studentId.substring(studentId.length()-6);
    }
}
