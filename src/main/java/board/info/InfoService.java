package board.info;

public class InfoService {
  private static InfoService instance = new InfoService();
  private InfoDAO infoDAO;

  private InfoService() {
    infoDAO = new InfoDAO();
  }

  public static InfoService getInstance() {
    return instance;
  }

  public Response2DTO getInfoByBoardPK(long boardPk) {
    InfoResponseDTO dto = infoDAO.selectInfoByBoardPK(boardPk);
    double avg = infoDAO.getInfoAvg(boardPk);
    int cnt = infoDAO.getInfoReviewCnt(boardPk);
    return new Response2DTO(dto, avg, cnt);
  }
}