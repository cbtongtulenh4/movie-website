package com.website.movie.utils;

import com.ocpsoft.pretty.time.PrettyTime;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class TimeUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private final static List<String> timesName = Arrays.asList("second", "minute", "hour", "day", "month", "year");
    private final static List<Long> timesValue = Arrays.asList(
            TimeUnit.MINUTES.toMillis(1),
            TimeUnit.SECONDS.toMillis(1),
            TimeUnit.HOURS.toMillis(1),
            TimeUnit.DAYS.toMillis(1),
            TimeUnit.DAYS.toMillis(31),
            TimeUnit.DAYS.toMillis(365)
    );

    public static String getSysDate(){
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }

    public static String getTimeAgoLibrary(LocalDateTime past){
        return new PrettyTime().format(Date.from(past.atZone(ZoneId.systemDefault()).toInstant()));
    }

    public static String getTimeAgoCustom(LocalDateTime past){
        LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant();
       long pastTime = past.toInstant(ZoneOffset.ofTotalSeconds(0)).toEpochMilli();
        long duration = System.currentTimeMillis() - pastTime;
        StringBuilder result = new StringBuilder();
        int temp;
        for(int i = timesValue.size() - 1; i >= 0; i--){
            temp = (int) (duration / timesValue.get(i));
            if (temp > 0){
                result.append(temp).append(" ").append(timesName.get(i)).append((temp == 1) ? "" : "s").append(" ago");
                break;
            }
        }
        if (result.toString().equals("")){
            result.append("0 second ago");
        }
        return result.toString();
    }

}
