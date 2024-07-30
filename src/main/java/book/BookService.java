package book;

public class BookService {
    private static BookService instance = new BookService();
    private BookDAO bookDAO;

    private BookService(){
        bookDAO = new BookDAO();
    }
    public static BookService getInstance() {
        return instance;
    }

    public BookResponseDTO getBookByBoardPK(long boardPk) {
        int totalBookLimit = bookDAO.getTotalBookLimit(boardPk);
        int bookCnt = bookDAO.getBookCnt(boardPk);
        return new BookResponseDTO(totalBookLimit, bookCnt);
    }

    public int getBookUser(long boardPk, long memberPk) {
        int bookUser = bookDAO.getBookUser(boardPk, memberPk);
        return bookUser;
    }
}