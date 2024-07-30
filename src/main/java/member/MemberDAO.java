package member;

import static member.util.BcryptEncoder.encode;
import static member.util.BcryptEncoder.isPasswordMatch;
import static member.util.MemberSQL.EMAILCHECK;
import static member.util.MemberSQL.EMAILNAMECHECK;
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
import domain.Reply;

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
            .phone(rs.getString("phone"))
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

  int join(String email, String password, String name, String phone, String nickname) {
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
      ps.setString(4, phone);
      ps.setString(5, nickname);
      return ps.executeUpdate();
    } catch (SQLException se) {
      System.out.println("[memberDAO] join: Error: " + se.getMessage());
      return FAILURE;
    }
  }
  int emailCheck(String email, String name) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      con = getConnection();
      if(name ==null){
        ps = con.prepareStatement(EMAILCHECK);
        ps.setString(1, email);
      }else {
        ps = con.prepareStatement(EMAILNAMECHECK);
        ps.setString(1, email);
        ps.setString(2,name);
      }
      rs = ps.executeQuery();
      if (rs.next()) {
        return rs.getInt("valid");
      }
    } catch (SQLException se) {
      System.out.println("[memberDAO] emailCheck: Error: " + se.getMessage());
    }
    return FAILURE;
  }
//  int emailCheck(String email) {
//    Connection con = null;
//    PreparedStatement ps = null;
//    ResultSet rs = null;
//    try {
//      con = getConnection();
//      ps = con.prepareStatement(EMAILCHECK);
//      ps.setString(1, email);
//      rs = ps.executeQuery();
//      if (rs.next()) {
//        return rs.getInt("valid");
//      }
//    } catch (SQLException se) {
//      System.out.println("[memberDAO] emailCheck: Error: " + se.getMessage());
//    }
//    return FAILURE;
//  }

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
    }catch (SQLException se){
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


  public ArrayList<Reply> myReplyList(int member_seq) {
    ArrayList<Reply> myRelpyList = null;
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
    ArrayList<Board> myBookingList = null;
    Connection con = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    String sql1 = MY_BOOKING1;
    String sql2 = MY_BOOKING2;
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    try {
      con = getConnection();
      pstmt1 = con.prepareStatement(sql1);
      pstmt1.setInt(1, member_seq);
      rs1 = pstmt1.executeQuery();
      while (rs1.next()) {
        //int book_seq = rs.getInt(1);
        //Date bDate = rs.getDate(2);
        //int cancel_YN = rs.getInt(3);
        //Date cDate = rs.getDate(4);
        int board_seq = rs1.getInt(6);

        //Book myBooking = new Book(book_seq, bDate, cancel_YN, cDate, member_seq, board_seq);

        pstmt2 = con.prepareStatement(sql2);
        pstmt2.setInt(1, board_seq);
        rs2 = pstmt2.executeQuery();
        while (rs2.next()) {
          String academy_name = rs2.getString(2);
          String addr = rs2.getString(3);
          String phone_num = rs2.getString(4);
          Date eDate = rs2.getDate(5);
          Date lDate = rs2.getDate(6);
          String grade = rs2.getString(7);
          String subject = rs2.getString(8);
          String content = rs2.getString(9);
          int book_limit = rs2.getInt(10);
          int valid = rs2.getInt(11);

          Board myBooking = new Board(board_seq, academy_name, addr, phone_num, eDate, lDate, grade,
              subject, content, book_limit, valid);
          myBookingList.add(myBooking);
        }
      }
      return myBookingList;

    } catch (SQLException se) {
      se.printStackTrace();
    } finally {
      try {
        pstmt2.close();
        pstmt1.close();
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
