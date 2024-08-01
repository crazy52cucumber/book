package book;

public class BookSQL {
    public final static String FIND_BOOK
            = "SELECT *\n"
            + "  FROM book\n"
            + " WHERE member_seq = ?\n"
            + "   AND book_seq = ?";

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
            + "   AND member_seq = ?\n"
            + "   AND board_seq = ?\n"
            + "   AND cancel_yn = 0";

    public final static String GET_CANCEL_YN
            = "SELECT cancel_yn\n"
            + "  FROM book\n"
            + " WHERE 1=1\n"
            + "   AND member_seq = ?\n"
            + "   AND board_seq = ?";

    public final static String INSERT_BOOK
            = "INSERT INTO book(bdate, cancel_yn, member_seq, board_seq) VALUES(NOW(), 0, ?, ?)";

    public final static String UPDATE_BOOK
            = "UPDATE book SET cancel_yn = 1, cancel_date= NOW() WHERE member_seq = ? AND board_seq = ?";

    public final static String RE_UPDATE_BOOK
            = "UPDATE book SET cancel_yn = 0, cancel_date= null WHERE member_seq = ? AND board_seq = ?";
}