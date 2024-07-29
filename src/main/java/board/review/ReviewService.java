package board.review;

import java.util.List;

public class ReviewService {
  private static ReviewService instance = new ReviewService();
  private ReviewDAO reviewDAO;

  private ReviewService() {
    reviewDAO = new ReviewDAO();
  }

  public static ReviewService getInstance() {
    return instance;
  }

  public ResponseDTO<ReviewResponseDTO> getReviewsByBoardPk(long boardPk) {
    List<ReviewResponseDTO> dto = reviewDAO.selectReviewsByBoardPk(boardPk).orElseThrow();
    int count = reviewDAO.countByBoardPk(boardPk);
    double average = reviewDAO.selectAllRateByBoardPk(boardPk);
    return new ResponseDTO(dto, count, average);
  }

}
