package board.info;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import board.review.ResponseDTO;
import board.review.ReviewResponseDTO;

@WebServlet("/info/*")
public class InfoController extends HttpServlet {
  private InfoService infoService;

  public InfoController() {
    infoService = InfoService.getInstance();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String uri = req.getRequestURI();
    try {
      long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
      getInfoByBoardPK(req, res, boardPk);
    } catch (NumberFormatException nfe) {
      nfe.printStackTrace();
    }
  }

  private void getInfoByBoardPK(HttpServletRequest req, HttpServletResponse res, long boardPk) throws ServletException, IOException {
    PrintWriter out = res.getWriter();
    Response2DTO infoByBoardPk = infoService.getInfoByBoardPK(boardPk);
  }
}