package book;

public class BookService {
  private static BookService instance = new BookService();
  private BookDAO bookDAO;

  private BookService() {
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

  public int getBookUser(long memberPk, long boardPk) {
    int bookUser = bookDAO.getBookUser(memberPk, boardPk);
    System.out.println("bookUser ?? => " + bookUser);
    return bookUser;
  }

  public int insertBook(long review, long boardPK) {
    return bookDAO.insertBook(review, boardPK);
  }

  public int updateBook(long review, long boardPK) {
    return bookDAO.updateBook(review, boardPK);
  }

  public int reUpdateBook(long review, long boardPK) {
    return bookDAO.reUpdateBook(review, boardPK);
  }

  public int getCancelBook(long memberPk, long boardPK) {
    return bookDAO.getCancelBook(memberPk, boardPK);
  }

  public int getBoardPkFromBookByMemberPk(long memberPk, long boardPk) {
    return bookDAO.selectBoardPkFromBookByMemberPk(memberPk, boardPk);
  }
}