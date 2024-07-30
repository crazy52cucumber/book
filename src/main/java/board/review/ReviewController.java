package board.review;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.eclipse.tags.shaded.org.apache.regexp.RE;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String uri = req.getRequestURI();
    System.out.println("이게 뭐지?: " + uri);
    String[] method = uri.split("/");
    System.out.println("아, " + Arrays.toString(method));
    try {
      long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
      if (method[2].startsWith("all"))
        getReviewByBoardPkWithPaging(req, res, boardPk);
      if (method[2].startsWith("add"))
        addReview(req, res, boardPk);
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

  private void getReviewByBoardPkWithPaging(HttpServletRequest req, HttpServletResponse res, long boardPk) throws ServletException, IOException {
    Gson gson = new Gson();
    PrintWriter out = res.getWriter();

    BufferedReader reader = req.getReader();
    RequestDTO paging = gson.fromJson(reader, RequestDTO.class);
    int count = reviewService.getCountbyBoardPk(boardPk);
    List<ReviewResponseDTO> reviewsByBoardPkWithPaging = reviewService.getReviewsByBoardPkWithPaging(boardPk, paging);

    JsonObject jsonObject = new JsonObject();
    jsonObject.addProperty("count", count);
    JsonArray jsonArray = gson.toJsonTree(reviewsByBoardPkWithPaging).getAsJsonArray();
    jsonObject.add("data", jsonArray);
    out.print(jsonObject.toString());
  }

  private void addReview(HttpServletRequest req, HttpServletResponse res, long boardPk) throws ServletException, IOException {

  }
}
