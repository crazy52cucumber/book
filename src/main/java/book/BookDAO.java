package book;

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
    void insertBook(long memberPK, long boardPK) {
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(BookSQL.INSERT_BOOK);
            pstmt.setLong(1, memberPK);
            pstmt.setLong(2, boardPK);
            int i = pstmt.executeUpdate();
            if (i == 0) {
                throw new SQLException("댓글 삽입 실패");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
}