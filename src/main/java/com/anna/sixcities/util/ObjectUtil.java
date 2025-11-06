package com.anna.sixcities.util;

public class ObjectUtil {
    public static Integer getImageNumber(String imageName) {
        return Math.abs(imageName.hashCode()) % 20 + 1;
    }
}
