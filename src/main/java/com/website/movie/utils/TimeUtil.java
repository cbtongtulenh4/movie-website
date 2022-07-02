package com.website.movie.utils;

import com.ocpsoft.pretty.time.PrettyTime;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

public class TimeUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static String getSysDate(){
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }

    public static String getTimeAgoLibrary(LocalDateTime past){
        return new PrettyTime().format(Date.from(past.atZone(ZoneId.systemDefault()).toInstant()));
    }

    public static String getTimeAgoCustom(){
        return null;
    }

}
