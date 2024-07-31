package board.review;

public class ReviewSQL {
  public static String SELECT_REVIEW_BY_BOARDPK = "select r.review_seq, m.member_seq, b.board_seq, bo.book_seq, r.rate, r.title,r.pros, r.cons, r.features, r.wishes, r.cdate, b.grade, m.nickname, r.cdate\n" +
          "          from review r join book bo on bo.BOOK_SEQ = r.BOOK_SEQ\n" +
          "          join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "          join member m on m.member_seq = bo.MEMBER_SEQ\n" +
          "          where b.board_seq = ? order by r.review_seq desc limit 0, 5";
  public static String SELECT_REVIEW_BY_BOARDPK_WITH_PAGING = "select r.review_seq, m.member_seq, b.board_seq, bo.book_seq, r.rate, r.title,r.pros, r.cons, r.features, r.wishes, r.cdate, b.grade, m.nickname, r.cdate\n" +
          "          from review r join book bo on bo.BOOK_SEQ = r.BOOK_SEQ\n" +
          "          join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "          join member m on m.member_seq = bo.MEMBER_SEQ\n" +
          "          where b.board_seq = ? order by r.review_seq desc limit ?, 5";

  public static String SELECT_ALL_RATE_BY_BOARDPK = "select TRUNCATE(AVG(r.RATE),1) rate from review r join book bo on r.BOOK_SEQ = bo.BOOK_SEQ\n" +
          "                         join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "                         where b.BOARD_SEQ = ?";
  public static String COUNT = "select count(*) from review r join book bo on r.BOOK_SEQ = bo.BOOK_SEQ\n" +
          "                join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "                where b.board_seq=?";
  public static String INSERT = "insert into review(rate, title, pros, cons, features, wishes, cdate, valid, book_seq, member_seq) values (?,?,?,?,?,?,now(),?,?,?)";

  public static String SELECT_REVIEW_BY_REVIEWPK = "select r.review_seq, m.member_seq, b.board_seq, bo.book_seq, r.rate, r.title,r.pros, r.cons, r.features, r.wishes, r.cdate, b.grade, m.nickname, r.cdate\n" +
          "                    from review r join book bo on bo.BOOK_SEQ = r.BOOK_SEQ\n" +
          "                    join board b on b.BOARD_SEQ = bo.BOARD_SEQ\n" +
          "                    join member m on m.member_seq = bo.MEMBER_SEQ\n" +
          "where r.review_seq = ?";

  public static String UPDATE_REVIEW_BY_REVIEWPK = "update review set title = ?, pros = ?, cons = ?, features = ?, wishes = ?, rate = ? where review_seq = ?";

}