package book;

import board.review.ReviewRequestDTO;
import dbutil.BaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO extends BaseDAO {
  private Connection con;

  public BookDAO() {
    try {
      con = getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  //public
  public long selectBookPkFromBooked(ReviewRequestDTO dto, int memberPk) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select b.book_seq from book b join member m on b.member_seq = m.member_seq\n" +
            "where b.board_seq = ? and b.CANCEL_YN = 0 and m.member_seq = ?";
    long result = 0;
    try {
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, dto.getBoardSeq());
      pstmt.setLong(2, memberPk);

      rs = pstmt.executeQuery();
      if (rs.next()) result = rs.getLong("book_seq");
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }
}
