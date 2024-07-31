package board.review;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import domain.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.BufferedReader;
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
    String[] method = uri.split("/");
    String reviewPkPara = req.getParameter("re");

    try {
      if (reviewPkPara != null) {
        int reviewPk = Integer.parseInt(reviewPkPara);
        getReviewByReviewPk(req, res, reviewPk);
      } else if (method[2].startsWith("all")) {
        long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
        getReviewByBoardPk(req, res, boardPk);
      } else if (method[2].startsWith("auth")) {
        checkCookie(req, res);
      } else if (method[2].startsWith("write")) {
        moveToWrite(req, res);
      }
    } catch (NumberFormatException nfe) {
      nfe.printStackTrace();
    }
  }

  private void getReviewByReviewPk(HttpServletRequest req, HttpServletResponse res, int reviewPk) throws ServletException, IOException {
    Gson gson = new Gson();
    PrintWriter out = res.getWriter();
    ReviewResponseDTO dto = reviewService.getReviewByReviewPk(reviewPk);

    out.print(gson.toJson(dto));
  }

  private void moveToWrite(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/board/review_write.jsp").forward(req, res);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String uri = req.getRequestURI();
    String[] method = uri.split("/");

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


  private void checkCookie(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    Cookie[] cookies = req.getCookies();
    PrintWriter out = res.getWriter();
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int result = 0;
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals("mySeq"))
        result = Integer.parseInt(cookie.getValue()) == member.getSeq() ? 1 : 0;
    }
    out.print("{\"result\":\"" + result + "\"}");
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
    Gson gson = new Gson();
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    PrintWriter out = res.getWriter();

    BufferedReader reader = req.getReader();
    ReviewRequestDTO dto = gson.fromJson(reader, ReviewRequestDTO.class);
    dto.setBoardSeq(boardPk);
    try {
      dto.setMemberSeq(member.getSeq());
    } catch (NullPointerException npe) {
      System.out.println("로그인 아직 안됨: " + npe.getMessage());
    }
    int result = reviewService.addReview(dto, member.getSeq());

    out.print("{\"result\":\"" + result + "\"}");
  }
}
