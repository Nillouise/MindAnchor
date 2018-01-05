package Nillouise.converter;

import Nillouise.controller.TaskController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;

/**
 * Created by win7x64 on 2017/8/14.
 */
public class StringToDateConverter implements Converter<String,Date>
{
    private String datePattern;
    private static final Logger LOGGER = LoggerFactory.getLogger(StringToDateConverter.class);


    public StringToDateConverter(String datePattern)
    {
        this.datePattern = datePattern;
    }

    public Date convert(String s)
    {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(datePattern);
            dateFormat.setLenient(false);
            Date r = dateFormat.parse(s);
            LOGGER.info("转换成的日期："+r.toString());
            return dateFormat.parse(s);
        } catch (ParseException e) {
            throw new IllegalArgumentException(
                    "invalid date format. Please use this pattern\"" + datePattern + "\"");
        }
    }
}
