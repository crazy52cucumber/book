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
    int count = getCountbyBoardPk(boardPk);
    double average = reviewDAO.selectAllRateByBoardPk(boardPk);
    return new ResponseDTO(dto, count, average);
  }

  public int getCountbyBoardPk(long boardPk) {
    return reviewDAO.countByBoardPk(boardPk);
  }

  public List<ReviewResponseDTO> getReviewsByBoardPkWithPaging(long boardPk, RequestDTO dto) {
    List<ReviewResponseDTO> responseDto = reviewDAO.selectReviewsByBoardPkWithPaging(boardPk, dto).orElseThrow();
    return responseDto;
  }
}
