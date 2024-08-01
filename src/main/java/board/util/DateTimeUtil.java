package board.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
  public static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public static String transfer(Date date) {
    return sdf.format(date);
  }
}
