package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.BaseDAO;

public class BookDAO extends BaseDAO{
	private Connection con;
	
	public BookDAO() {
		try {
			con = getConnection();
		}catch(SQLException e) {
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
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			return cnt;
		}catch(SQLException se) {
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
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			return cnt;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}
	}
}