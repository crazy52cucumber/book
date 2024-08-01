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

<<<<<<< HEAD
    public ResponseDTO getBookByBoardPK(long boardPk) {
        int totalBookLimit = bookDAO.getTotalBookLimit(boardPk);
        int bookCnt = bookDAO.getBookCnt(boardPk);
        return new ResponseDTO(totalBookLimit, bookCnt);
    }
=======
  public BookResponseDTO getBookByBoardPK(long boardPk) {
    int totalBookLimit = bookDAO.getTotalBookLimit(boardPk);
    int bookCnt = bookDAO.getBookCnt(boardPk);
    return new BookResponseDTO(totalBookLimit, bookCnt);
  }
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07

  public int getBookUser(long review, long boardPk) {
    int bookUser = bookDAO.getBookUser(review, boardPk);
    return bookUser;
  }

<<<<<<< HEAD
    public int insertBook(long memberPk, long boardPK) {
        return bookDAO.insertBook(memberPk, boardPK);
    }

    public int updateBook(long memberPk, long boardPK) {
        return bookDAO.updateBook(memberPk, boardPK);
    }

    public int reUpdateBook(long memberPk, long boardPK) {
        return bookDAO.reUpdateBook(memberPk, boardPK);
    }
=======
  public int insertBook(long review, long boardPK) {
    return bookDAO.insertBook(review, boardPK);
  }

  public int updateBook(long review, long boardPK) {
    return bookDAO.updateBook(review, boardPK);
  }

  public int reUpdateBook(long review, long boardPK) {
    return bookDAO.reUpdateBook(review, boardPK);
  }
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07

  public int getCancelBook(long memberPk, long boardPK) {
    return bookDAO.getCancelBook(memberPk, boardPK);
  }

  public int getBoardPkFromBookByMemberPk(long memberPk, long boardPk) {
    return bookDAO.selectBoardPkFromBookByMemberPk(memberPk, boardPk);
  }
}