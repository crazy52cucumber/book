package board.info;

public class InfoSQL {
    public static String SELECT_INFO
            = "SELECT academy_name, addr, phone_num, edate, ldate, grade, subject, content, book_limit\r\n"
            + "  FROM board\r\n"
            + " WHERE 1=1\r\n"
            + "   AND BOARD_SEQ = ?\r\n"
            + "	AND VALID = 0";

    public static String SELECT_AVG_RATE
            = "SELECT TRUNCATE(AVG(r.rate), 2) as avg\r\n"
            + " FROM reply r\r\n"
            + " JOIN book bo\r\n"
            + "   ON r.book_seq = bo.book_seq\r\n"
            + " JOIN board b\r\n"
            + "   ON b.board_seq = bo.board_seq\r\n"
            + "WHERE b.board_seq = ?";

    public static String SELECT_REVIEW_CNT
            = "SELECT COUNT(r.reply_seq) as cnt\r\n"
            + " FROM reply r\r\n"
            + " JOIN book bo\r\n"
            + "   ON r.book_seq = bo.book_seq\r\n"
            + " JOIN board b\r\n"
            + "   ON b.board_seq = bo.board_seq\r\n"
            + "WHERE b.board_seq = ?";
}