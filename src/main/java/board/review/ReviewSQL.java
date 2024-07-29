package board.review;

public class ReviewSQL {
  public static String SELECT_REVIEW_BY_BOARDPK = "select r.reply_seq, m.member_seq, b.board_seq, bo.book_seq, r.rate, r.title, b.grade, m.nickname, r.cdate\n" +
          "          from reply r join book bo on bo.BOOK_SEQ = r.BOOK_SEQ\n" +
          "          join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "          join member m on m.member_seq = bo.MEMBER_SEQ\n" +
          "          where b.board_seq = ? order by r.reply_seq desc limit 0, 5";
  public static String SELECT_ALL_RATE_BY_BOARDPK = "select r.RATE from reply r join book bo on r.BOOK_SEQ = bo.BOOK_SEQ\n" +
          "                         join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "                         where b.BOARD_SEQ = ?";
  public static String COUNT = "select count(*) from reply r join book bo on r.BOOK_SEQ = bo.BOOK_SEQ\n" +
          "                join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "                where b.board_seq=?";
}

