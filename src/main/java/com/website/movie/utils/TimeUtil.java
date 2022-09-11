package com.website.movie.utils;

import com.ocpsoft.pretty.time.PrettyTime;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.chrono.IsoChronology;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.time.format.FormatStyle;
import java.util.*;
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

    private static final Locale defaultFormattingLocale
            = Locale.getDefault(Locale.Category.FORMAT);
    private static final String defaultDateFormat = DateTimeFormatterBuilder
            .getLocalizedDateTimePattern(FormatStyle.SHORT, null,
                    IsoChronology.INSTANCE, defaultFormattingLocale);
    private static final DateTimeFormatter dateFormatter
            = DateTimeFormatter.ofPattern(defaultDateFormat, defaultFormattingLocale);


    private final static SimpleDateFormat formatCommon = new SimpleDateFormat("dd/MM/yyyy");


    public static Date toDate(final String dateTime) throws ParseException {
        return formatCommon.parse(formatCommon.format(dateTime));
    }

    public static LocalDate toLocalDate(Date dateToConvert){
        return new java.sql.Date(dateToConvert.getTime()).toLocalDate();
    }

    public static LocalDate toLocalDate(final String dateTime) throws DateTimeParseException {
         return LocalDate.parse(dateTime, dateFormatter);
    }


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
                return result.toString();
            }
        }
        return "0 second ago";
    }

}
