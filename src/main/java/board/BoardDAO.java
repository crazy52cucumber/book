package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.BaseDAO;

public class BoardDAO extends BaseDAO {
  private Connection con;

  public BoardDAO() {
    try {
      con = getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }


  public BoardResponseDTO selectBoardByBoardPk(long boardPk) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    BoardResponseDTO board = null;

    String sql = "select * from board where board_seq=?";
    try {
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, boardPk);

      rs = pstmt.executeQuery();
      if (rs.next()) {
        board = board.builder()
                .boardSeq(rs.getInt("board_seq"))
                .academyName(rs.getString("academy_name"))
                .addr(rs.getString("addr"))
                .phoneNum(rs.getString("phone_num"))
                .edate(rs.getDate("edate"))
                .ldate(rs.getDate("ldate"))
                .grade(rs.getString("grade"))
                .subject(rs.getString("subject"))
                .content(rs.getString("content"))
                .bookLimit(rs.getInt("book_limit"))
                .valid(rs.getInt("valid"))
                .build();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return board;
  }
}
