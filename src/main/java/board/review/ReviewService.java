package board.review;

import book.BookDAO;

import java.util.List;

public class ReviewService {
    private static ReviewService instance = new ReviewService();
    private ReviewDAO reviewDAO;
    private BookDAO bookDAO;

    private ReviewService() {
        reviewDAO = new ReviewDAO();
        bookDAO = new BookDAO();
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

    // 서버에서 예약되지 않은 사람의 예약일 때 예외 발생시켜야됨
    public int addReview(ReviewRequestDTO dto, int review) {
        long bookSeq = bookDAO.selectBookPkFromBooked(dto, review);
        if (bookSeq == 0) {
            return 2;
        }
        return reviewDAO.insertReview(dto, bookSeq);
    }
}
