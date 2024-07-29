package board;


import board.review.ResponseDTO;
import board.review.ReviewResponseDTO;
import board.review.ReviewService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board")
public class BoardController extends HttpServlet {
  private ReviewService reviewService;

  public BoardController() {
    reviewService = ReviewService.getInstance();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    res.setContentType("text/html; charset=UTF-8");
    String seqParam = req.getParameter("seq");
    int seq = 0;
    if (seqParam != null) {
      seq = Integer.parseInt(seqParam.trim());
      // reply 불러오기
      ResponseDTO<ReviewResponseDTO> review = reviewService.getReviewsByBoardPk(seq);
      req.setAttribute("review", review);
      req.getRequestDispatcher("WEB-INF/jsp/board/content.jsp?seq=" + seq).forward(req, res);
    }


  }
}
