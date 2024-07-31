package book;

import board.review.ReviewRequestDTO;
import dbutil.BaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.review.RequestDTO;
import dbutil.BaseDAO;

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

    /*강의 예약 여부*/
    int getBookUser(long boardPK, long memberPK) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(BookSQL.GET_BOOK_USER);
            pstmt.setLong(1, boardPK);
            pstmt.setLong(2, memberPK);
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
    }

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
                throw new SQLException("댓글 삭제 실패");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return result;
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