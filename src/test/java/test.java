import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.time.chrono.IsoChronology;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.time.format.FormatStyle;
import java.util.Locale;
import java.util.Scanner;

public class test {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/04/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final Locale defaultFormattingLocale
            = Locale.getDefault(Locale.Category.FORMAT);
    private static final String defaultDateFormat = DateTimeFormatterBuilder
            .getLocalizedDateTimePattern(FormatStyle.SHORT, null,
                    IsoChronology.INSTANCE, defaultFormattingLocale);
    private static final DateTimeFormatter dateFormatter
            = DateTimeFormatter.ofPattern(defaultDateFormat, defaultFormattingLocale);


    private static void main(String[] args) {
        Scanner inputScanner = new Scanner(System.in);

        LocalDate sampleDate
                = Year.now().minusYears(1).atMonth(Month.NOVEMBER).atDay(26);
        System.out.println("Enter date in " + defaultDateFormat
                + " format, for example " + sampleDate.format(dateFormatter));
        String dateString = inputScanner.nextLine();
        try {
            LocalDate inputDate = LocalDate.parse(dateString, dateFormatter);
            System.out.println("Date entered was " + inputDate);
            System.out.println(inputDate.getYear());
            System.out.println(inputDate.getMonthValue());
            System.out.println(inputDate.getDayOfMonth());
        } catch (DateTimeParseException dtpe) {
            System.out.println("Invalid date: " + dateString);
        }

    }

}
