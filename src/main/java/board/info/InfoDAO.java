package board.info;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.BaseDAO;

public class InfoDAO extends BaseDAO {
  private Connection con;

  public InfoDAO() {
    try {
      con = getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /*학원 정보*/
  InfoResponseDTO selectInfoByBoardPK(long boardPK) {
    InfoResponseDTO dto = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(InfoSQL.SELECT_INFO);
      pstmt.setLong(1, boardPK);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        String academyName = rs.getString("academy_name");
        String addr = rs.getString("addr");
        String phoneNum = rs.getString("phone_num");
        Date edate = rs.getDate("edate");
        Date ldate = rs.getDate("ldate");
        String grade = rs.getString("grade");
        String subject = rs.getString("subject");
        String content = rs.getString("content");
        int bookLimit = rs.getInt("book_limit");

        dto = new InfoResponseDTO(academyName, addr, phoneNum, edate, ldate, grade, subject, content, bookLimit);
      }
      return dto;
    } catch (SQLException se) {
      se.printStackTrace();
      return null;
    }
  }

  /*별점*/
  double getInfoAvg(long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(InfoSQL.SELECT_AVG_RATE);
      pstmt.setLong(1, boardPK);
      rs = pstmt.executeQuery();
      double avg = 0L;
      if (rs.next()) {
        avg = rs.getDouble(1);
      }
      return avg;
    } catch (SQLException se) {
      se.printStackTrace();
      return -1;
    }
  }

  /*리뷰수*/
  int getInfoReviewCnt(long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(InfoSQL.SELECT_REVIEW_CNT);
      pstmt.setLong(1, boardPK);
      rs = pstmt.executeQuery();
      int cnt = 0;
      if (rs.next()) {
        cnt = rs.getInt(1);
      }
      return cnt;
    } catch (SQLException se) {
      se.printStackTrace();
      return -1;
    }
  }
}