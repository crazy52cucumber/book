package member;

import static member.util.BcryptEncoder.encode;
import static member.util.BcryptEncoder.isPasswordMatch;
import static member.util.MemberSQL.EMAILCHECK;
import static member.util.MemberSQL.FINDID;
import static member.util.MemberSQL.JOIN;
import static member.util.SignupConst.ERROR;
import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.NOID;
import static member.util.MemberSQL.GETMEMBER;
import static member.util.MemberSQL.PASSWORDMATCH;

import domain.Board;
import dbutil.BaseDAO;
import domain.Member;
import domain.Review;

import java.sql.*;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static member.MemberSQL.*;

class MemberDAO extends BaseDAO {

  int passwordMatch(String email, String password) {
    try {
      Connection con = getConnection();
      PreparedStatement ps = con.prepareStatement(PASSWORDMATCH);
      ps.setString(1, email);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
        String dbPassword = rs.getString("password");
        return isPasswordMatch(password, dbPassword);
      }
      return NOID;
    } catch (SQLException e) {
      System.out.println("[memberDAO] passwordMatch: Error:" + e.getMessage());
      return ERROR;
    }
  }

  Member getMember(String email) {
    ResultSet rs = null;
    Connection con = null;
    PreparedStatement ps = null;
    try {
      con = getConnection();
      ps = con.prepareStatement(GETMEMBER);
      ps.setString(1, email);
      rs = ps.executeQuery();
      Member member = null;
      if (rs.next()) {
        member = Member.builder()
                .seq(rs.getInt("member_seq"))
                .email(rs.getString("email"))
                .name(rs.getString("name"))
                .nickname(rs.getString("nickname"))
                .rdate(rs.getDate("rdate"))
                .user_type(rs.getByte("user_type"))
                .valid(rs.getByte("valid")).build();
      }
      return member;
    } catch (SQLException se) {
      System.out.println("[memberDAO] getMember: Error: " + se.getMessage());
    } finally {
      closeAll(rs, ps);
      if (con != null) {

      }
    }

    return null;
  }

  int join(String email, String password, String name, int phoneNum, String nickname) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String hashedPassword = encode(password);
    try {
      con = getConnection();
      ps = con.prepareStatement(JOIN);
      ps.setString(1, email);
      ps.setString(2, hashedPassword);
      ps.setString(3, name);
      ps.setInt(4, phoneNum);
      ps.setString(5, nickname);
      return ps.executeUpdate();
    } catch (SQLException se) {
      System.out.println("[memberDAO] join: Error: " + se.getMessage());
      return FAILURE;
    }
  }

  int emailCheck(String email) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      con = getConnection();
      ps = con.prepareStatement(EMAILCHECK);
      ps.setString(1, email);
      rs = ps.executeQuery();
      if (rs.next()) {
        return rs.getInt("valid");
      }
    } catch (SQLException se) {
      System.out.println("[memberDAO] emailCheck: Error: " + se.getMessage());
    }
    return FAILURE;
  }

  String findId(String name, long phoneNum) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      con = getConnection();
      ps = con.prepareStatement(FINDID);
      ps.setString(1, name);
      ps.setLong(2, phoneNum);
      rs = ps.executeQuery();
      if (rs.next()) {
        return rs.getString("email");
      }
    } catch (SQLException se) {
      System.out.println("[memberDAO] findId: Error: " + se.getMessage());
    }
    return null;
  }

  public void modify(Member modifiedMember) {
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = MODIFY_INFO;
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, modifiedMember.getPassword());
      pstmt.setString(2, modifiedMember.getNickname());
      pstmt.setInt(3, modifiedMember.getSeq());
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

  public boolean withdraw(int seq) {
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = WITHDRAW;
    ResultSet rs = null;
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, seq);
      rs = pstmt.executeQuery();

      return true;
    } catch (SQLException se) {
      return false;
    } finally {
      try {
        pstmt.close();
        con.close();
      } catch (SQLException se) {
      }
    }
  }


  public ArrayList<Review> myReviewList(int member_seq) {
    ArrayList<Review> myRelpyList = new ArrayList<>();
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = MY_REPLY;
    ResultSet rs = null;
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, member_seq);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        int review_seq = rs.getInt(1);
        int rate = rs.getInt(2);
        String title = rs.getString(3);
        String pros = rs.getString(4);
        String cons = rs.getString(5);
        String features = rs.getString(6);
        String wishes = rs.getString(7);
        Date cdate = rs.getDate(8);
        int valid = rs.getInt(9);
        int book_seq = rs.getInt(10);

        System.out.println(review_seq);


        Review myReview = new Review(review_seq, rate, title, pros, cons, features, wishes, cdate, valid, book_seq);
        myRelpyList.add(myReview);
      }
      return myRelpyList;
    } catch (SQLException se) {
      se.printStackTrace();
    } finally {
      try {
        pstmt.close();
        con.close();
      } catch (SQLException se) {
      }
    }
    return null;
  }

  public ArrayList<Board> myBookingList(int member_seq) {
    ArrayList<Board> myBookingList = new ArrayList();
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = MY_BOOKING;
    ResultSet rs = null;
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, member_seq);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        int board_seq = rs.getInt(1);
        String academy_name = rs.getString(2);
        String addr = rs.getString(3);
        String phone_num = rs.getString(4);
        Date eDate = rs.getDate(5);
        Date lDate = rs.getDate(6);
        String grade = rs.getString(7);
        String subject = rs.getString(8);
        String content = rs.getString(9);
        int book_limit = rs.getInt(10);
        int valid = rs.getInt(11);

        Board myBooking = new Board(board_seq, academy_name, addr, phone_num, eDate, lDate, grade, subject, content, book_limit, valid);
        myBookingList.add(myBooking);
      }
      return myBookingList;

    } catch (SQLException se) {
      se.printStackTrace();
    } finally {
      try {
        pstmt.close();
        con.close();
      } catch (SQLException se) {
      }
    }
    return null;
  }

  Member getMemberByEmail(String email, String name) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      con = getConnection();
      ps = con.prepareStatement(EMAILNAME);
      ps.setString(1, email);
      ps.setString(2, name);
      rs = ps.executeQuery();
      Member member = null;
      if (rs.next()) {
        member = Member.builder()
                .email(rs.getString("email"))
                .name(rs.getString("name")).build();
      }
      return member;
    } catch (SQLException se) {
      System.out.println("[memberDAO] getMemberByEmail: Error: " + se.getMessage());
    }
    return null;
  }


}
