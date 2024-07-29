package member;

import static member.util.BcryptEncoder.encode;
import static member.util.BcryptEncoder.isPasswordMatch;
import static member.util.MemberSQL.EMAILCHECK;
import static member.util.MemberSQL.JOIN;
import static member.util.SignupConst.ERROR;
import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.NOID;
import static member.util.MemberSQL.GETMEMBER;
import static member.util.MemberSQL.PASSWORDMATCH;

import dbutil.BaseDAO;
import domain.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
