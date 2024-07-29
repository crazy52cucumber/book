package member;


import domain.Board;
import domain.Book;
import domain.Member;
import domain.Reply;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

import static member.MemberSQL.*;

public class MemberDAO {
    private DataSource ds;

    MemberDAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            ds = (DataSource) envContext.lookup("jdbc/TestDB");
        } catch (NamingException ne) {
            System.out.println("Dbcp객체(jdbc/TestDB)를 못찾음");
        }
    }

    public void modify(Member member) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = MODIFY_INFO;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member.getPassword());
            pstmt.setString(2, member.getNickname());
            pstmt.setInt(3, member.getSeq());
            //System.out.println();
            int i = pstmt.executeUpdate();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                pstmt.close();
                con.close();
            } catch (SQLException se) {
            }
        }

    }

    public void withdraw(int member_seq) {

    }

    public ArrayList<Reply> myReplyList(int member_seq) {
        ArrayList<Reply> myRelpyList = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = MY_REPLY;
        ResultSet rs = null;
        try{
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, member_seq);
            rs = pstmt.executeQuery();
            while(rs.next()){
                int reply_seq = rs.getInt(1);
                int rate = rs.getInt(2);
                String content = rs.getString(3);
                Date cdate = rs.getDate(4);
                int board_seq = rs.getInt(6);
                int valid = rs.getInt(7);

                Reply myReply = new Reply(reply_seq, rate, content, cdate, member_seq, board_seq, valid);

                myRelpyList.add(myReply);
            }
            return myRelpyList;
        }catch (SQLException se){
            se.printStackTrace();
        }finally{
            try{
                pstmt.close();
                con.close();
            }catch(SQLException se){}
        }
        return null;
    }

    public ArrayList<Board> myBookingList(int member_seq) {
        ArrayList<Board> myBookingList = null;
        Connection con = null;
        PreparedStatement pstmt1 =null;
        PreparedStatement pstmt2 = null;
        String sql1 = MY_BOOKING1;
        String sql2 = MY_BOOKING2;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        try{
            con = ds.getConnection();
            pstmt1 = con.prepareStatement(sql1);
            pstmt1.setInt(1, member_seq);
            rs1 = pstmt1.executeQuery();
            while(rs1.next()){
                //int book_seq = rs.getInt(1);
                //Date bDate = rs.getDate(2);
                //int cancel_YN = rs.getInt(3);
                //Date cDate = rs.getDate(4);
                int board_seq = rs1.getInt(6);

                //Book myBooking = new Book(book_seq, bDate, cancel_YN, cDate, member_seq, board_seq);

                pstmt2 = con.prepareStatement(sql2);
                pstmt2.setInt(1, board_seq);
                rs2 = pstmt2.executeQuery();
                while(rs2.next()){
                    String academy_name = rs2.getString(2);
                    String addr = rs2.getString(3);
                    String phone_num = rs2.getString(4);
                    Date eDate = rs2.getDate(5);
                    Date lDate = rs2.getDate(6);
                    String grade = rs2.getString(7);
                    String subject = rs2.getString(8);
                    String content = rs2.getString(9);
                    int book_limit =rs2.getInt(10);
                    int valid = rs2.getInt(11);

                    Board myBooking = new Board(board_seq, academy_name, addr, phone_num, eDate, lDate, grade, subject, content, book_limit, valid);
                    myBookingList.add(myBooking);
                }
            }
            return myBookingList;

        }catch (SQLException se){
            se.printStackTrace();
        }finally{
            try{
                pstmt2.close();
                pstmt1.close();
                con.close();
            }catch (SQLException se){}
        }
        return null;
    }


}
