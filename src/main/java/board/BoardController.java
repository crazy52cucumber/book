package board;


import board.info.InfoResponseDTO;
import board.info.InfoService;
import board.info.Response2DTO;
import board.review.ResponseDTO;
import board.review.ReviewResponseDTO;
import board.review.ReviewService;
import book.BookResponseDTO;
import book.BookService;
import domain.Member;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/board")
public class BoardController extends HttpServlet {
  private ReviewService reviewService;
  private InfoService infoService;
  private BookService bookService;

  public BoardController() {
    reviewService = ReviewService.getInstance();
    infoService = InfoService.getInstance();
    bookService = BookService.getInstance();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    res.setContentType("text/html; charset=UTF-8");
    String seqParam = req.getParameter("seq");

    int seq = 0;
    int memberSeq = -1;
    if (seqParam != null) {
      seq = Integer.parseInt(seqParam.trim());
      // info 불러오기
      Response2DTO info = infoService.getInfoByBoardPK(seq);
      req.setAttribute("info", info);
      // reply 불러오기
      ResponseDTO<ReviewResponseDTO> review = reviewService.getReviewsByBoardPk(seq);
      req.setAttribute("review", review);
      // book cnt 불러오기
      BookResponseDTO book = bookService.getBookByBoardPK(seq);
      req.setAttribute("book", book);
      // book user 불러오기
      HttpSession session = req.getSession(false);
        memberSeq = ((Member) session.getAttribute("member")).getSeq();
        if (memberSeq > 0) {
          int bookuser = bookService.getBookUser(seq, memberSeq);
          req.setAttribute("statusBook", bookuser);
        }
      req.getRequestDispatcher("WEB-INF/jsp/board/content.jsp?seq=" + seq).forward(req, res);
    }
  }
}