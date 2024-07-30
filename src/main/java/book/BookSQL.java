package book;

public class BookSQL {
    public final static String TOTAL_BOOK_LIMIT
            = "SELECT book_limit\r\n"
            + "  FROM board\r\n"
            + " WHERE 1=1\r\n"
            + "   AND board_seq = ?";

    public final static String BOOK_CNT
            = "SELECT count(book_seq) AS cnt\r\n"
            + "  FROM book\r\n"
            + " WHERE 1=1\r\n"
            + "   AND board_seq = ?\r\n"
            + "   AND cancel_yn = 0";

    public final static String GET_BOOK_USER
            = "SELECT member_seq\n"
            + "  FROM book\n"
            + " WHERE 1=1\n"
            + "   AND board_seq = ?\n"
            + "   AND member_seq = ?\n"
            + "   AND cancel_yn = 0";

    public final static String INSERT_BOOK
            = "INSERT INTO book(bdate, cancel_yn, member_seq, board_seq) VALUES(NOW(), 0, ?, ?)";
}