package board.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
  private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  public static String transfer(Date date) {
    return sdf.format(date);
  }
}
