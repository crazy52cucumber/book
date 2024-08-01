package book;

import board.review.ResponseDTO;
import board.review.ReviewRequestDTO;
import dbutil.BaseDAO;

import java.sql.*;

public class BookDAO extends BaseDAO {
  private Connection con;

  public BookDAO() {
    try {
      con = getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /*강의 인원수*/
  int getTotalBookLimit(long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(BookSQL.TOTAL_BOOK_LIMIT);
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

  /*강의 예약자 수*/
  int getBookCnt(long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(BookSQL.BOOK_CNT);
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

<<<<<<< HEAD
    /*강의 예약 여부*/
    int getBookUser(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(BookSQL.GET_BOOK_USER);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
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
=======
  /*강의 예약 여부*/
  int getBookUser(long review, long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(BookSQL.GET_BOOK_USER);
      pstmt.setLong(1, review);
      pstmt.setLong(2, boardPK);
      rs = pstmt.executeQuery();
      int cnt = 0;
      if (rs.next()) {
        cnt = rs.getInt(1);
      }
      return cnt;
    } catch (SQLException se) {
      se.printStackTrace();
      return -1;
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07
    }
  }

<<<<<<< HEAD
    /*강의 예약*/
    int insertBook(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = con.prepareStatement(BookSQL.INSERT_BOOK);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
            result = pstmt.executeUpdate();
            if (result == 0) {
                throw new SQLException("댓글 삽입 실패");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return result;
=======
  /*강의 예약*/
  int insertBook(long review, long boardPK) {
    PreparedStatement pstmt = null;
    int result = 0;
    try {
      pstmt = con.prepareStatement(BookSQL.INSERT_BOOK);
      pstmt.setLong(1, review);
      pstmt.setLong(2, boardPK);
      result = pstmt.executeUpdate();
      if (result == 0) {
        throw new SQLException("댓글 삽입 실패");
      }
    } catch (SQLException se) {
      se.printStackTrace();
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07
    }
    return result;
  }

<<<<<<< HEAD
    /*강의 취소*/
    int updateBook(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = con.prepareStatement(BookSQL.UPDATE_BOOK);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
            result = pstmt.executeUpdate();
            if (result == 0) {
                throw new SQLException("댓글 수정 실패");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return result;
=======
  /*강의 취소*/
  int updateBook(long review, long boardPK) {
    PreparedStatement pstmt = null;
    int result = 0;
    try {
      pstmt = con.prepareStatement(BookSQL.UPDATE_BOOK);
      pstmt.setLong(1, review);
      pstmt.setLong(2, boardPK);
      result = pstmt.executeUpdate();
      if (result == 0) {
        throw new SQLException("댓글 수정 실패");
      }
    } catch (SQLException se) {
      se.printStackTrace();
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07
    }
    return result;
  }

<<<<<<< HEAD
    /*강의 재예약*/
    int reUpdateBook(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = con.prepareStatement(BookSQL.RE_UPDATE_BOOK);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
            result = pstmt.executeUpdate();
            if (result == 0) {
                throw new SQLException("댓글 재수정 실패");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return result;
=======
  /*강의 재예약*/
  int reUpdateBook(long review, long boardPK) {
    PreparedStatement pstmt = null;
    int result = 0;
    try {
      pstmt = con.prepareStatement(BookSQL.RE_UPDATE_BOOK);
      pstmt.setLong(1, review);
      pstmt.setLong(2, boardPK);
      result = pstmt.executeUpdate();
      if (result == 0) {
        throw new SQLException("댓글 재수정 실패");
      }
    } catch (SQLException se) {
      se.printStackTrace();
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07
    }
    return result;
  }

<<<<<<< HEAD
    /*강의 취소 여부*/
    int getCancelBook(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(BookSQL.GET_CANCEL_YN);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
            rs = pstmt.executeQuery();
            int cnt = -1;
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
            return cnt;
        } catch (SQLException se) {
            se.printStackTrace();
            return -1;
        }
=======
  /*강의 취소 여부*/
  int getCancelBook(long review, long boardPK) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = con.prepareStatement(BookSQL.GET_CANCEL_YN);
      pstmt.setLong(1, review);
      pstmt.setLong(2, boardPK);
      rs = pstmt.executeQuery();
      int cnt = -1;
      if (rs.next()) {
        cnt = rs.getInt(1);
      }
      return cnt;
    } catch (SQLException se) {
      se.printStackTrace();
      return -1;
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07
    }
  }

<<<<<<< HEAD
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
=======
  //public
  public long selectBookPkFromBooked(ReviewRequestDTO dto, int review) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select b.book_seq from book b join member m on b.member_seq = m.member_seq\n" +
            "where b.board_seq = ? and b.CANCEL_YN = 0 and m.member_seq = ?";
    long result = 0;
    try {
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, dto.getBoardSeq());
      pstmt.setLong(2, review);
>>>>>>> 0132a23451b582f3ed223e3e15bd31b8dae49b07

      rs = pstmt.executeQuery();
      if (rs.next()) result = rs.getLong("book_seq");
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public int selectBoardPkFromBookByMemberPk(long memberPk, long boardPk) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select board_seq from book where member_seq = ? and board_seq = ? and CANCEL_YN = 0";

    int result = 0;
    try {
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, memberPk);
      pstmt.setLong(2, boardPk);

      rs = pstmt.executeQuery();
      if (rs.next()) result = 1;
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      closeAll(rs, pstmt);
    }
    System.out.println("result: " + result);
    return result;
  }
}