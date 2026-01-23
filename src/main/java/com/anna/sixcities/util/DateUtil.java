package com.anna.sixcities.util;

import java.time.LocalDate;

public class DateUtil {

    public static LocalDate sqlDateToLocalDate(java.sql.Date date) {
        return date.toLocalDate();
    }

    public static LocalDate objectToLocalDate(Object object) {
        return sqlDateToLocalDate((java.sql.Date) object);
    }
}
