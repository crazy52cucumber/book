package board;

public class BoardService {
  private BoardDAO boardDAO;
  private static final BoardService instance = new BoardService();

  private BoardService() {
    boardDAO = new BoardDAO();
  }

  public static BoardService getInstance() {
    return instance;
  }

  public BoardResponseDTO getBoardByBoardPk(long boardPk) {
    return boardDAO.selectBoardByBoardPk(boardPk);
  }
}
