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
}