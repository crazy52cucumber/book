package board.review;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.eclipse.tags.shaded.org.apache.regexp.RE;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/reviews/*")
public class ReviewController extends HttpServlet {
  private ReviewService reviewService;

  public ReviewController() {
    reviewService = ReviewService.getInstance();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String uri = req.getRequestURI();
    try {
      long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
      getReviewByBoardPk(req, res, boardPk);
    } catch (NumberFormatException nfe) {
      nfe.printStackTrace();
    }

  }

  private void getReviewByBoardPk(HttpServletRequest req, HttpServletResponse res, long boardPk) throws ServletException, IOException {
    Gson gson = new Gson();
    PrintWriter out = res.getWriter();
    List<ReviewResponseDTO> dto = new ArrayList();
    ResponseDTO<ReviewResponseDTO> reviewsByBoardPk = reviewService.getReviewsByBoardPk(boardPk);
    for (ReviewResponseDTO e : reviewsByBoardPk.getDto()) {
      dto.add(e);
    }

    out.print(gson.toJson(dto));
  }
}
