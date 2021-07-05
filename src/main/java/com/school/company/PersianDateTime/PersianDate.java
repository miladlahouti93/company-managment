package com.school.company.PersianDateTime;

import java.time.ZoneId;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.TimeZone;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.GregorianCalendar;
import com.ibm.icu.util.ULocale;


public class PersianDate {
    public String From_Gregorian_to_Persian (int year,int month,int date) {

        ULocale PERSIAN_LOCALE = new ULocale("fa_IR@calendar=persian");
        ULocale GREGORIAN_LOCALE = new ULocale("en@calendar=gregorian");
        ZoneId IRAN_ZONE_ID = ZoneId.of("Asia/Tehran");

        Calendar gregorianCalendar = new GregorianCalendar(GREGORIAN_LOCALE);
        gregorianCalendar.setLenient(false);
        gregorianCalendar.set(year, month,date);
        Calendar persiancal = Calendar.getInstance(PERSIAN_LOCALE);
        persiancal.clear();
        persiancal.setTimeZone(TimeZone.getTimeZone("Asia/Tehran"));

        persiancal.setTime(gregorianCalendar.getTime());

        // Display the date.
        return  (persiancal.get(Calendar.YEAR) ) + "/" + ( persiancal.get (Calendar.MONTH) + 1 ) + "/" + persiancal.get(Calendar.DATE);

    }
    public String From_Persian_to_Gregorian(int year,int month , int date) {

        ULocale PERSIAN_LOCALE = new ULocale("fa_IR@calendar=persian");
        ULocale GREGORIAN_LOCALE = new ULocale("en@calendar=gregorian");
        ZoneId IRAN_ZONE_ID = ZoneId.of("Asia/Tehran");

        Calendar persiancal = Calendar.getInstance(PERSIAN_LOCALE);
        persiancal.clear();
        persiancal.setTimeZone(TimeZone.getTimeZone("Asia/Tehran"));
        persiancal.set(year,month-1,date);
        SimpleDateFormat df1 = new SimpleDateFormat ("yyyy MM dd", GREGORIAN_LOCALE);
        return df1.format(persiancal.getTime());

    }
}
