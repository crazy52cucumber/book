package member;

import domain.Board;
import domain.Member;
import domain.Review;
import lombok.Getter;

import java.sql.Date;
import java.util.ArrayList;

public class MemberService {

  private MemberDAO dao;

  @Getter
  private static MemberService instance = new MemberService();

  private MemberService() {
    dao = new MemberDAO();
  }

  public static void setInstance(MemberService instance) {
    MemberService.instance = instance;
  }

  public void modifyS(Member modifiedMember) {
    dao.modify(modifiedMember);
  }

  public boolean withdrawS(int seq) {
    return dao.withdraw(seq);
  }

  public ArrayList<Review> myReviewListS(int member_seq) {
    return dao.myReviewList(member_seq);
  }

  public ArrayList<Board> myBookingListS(int member_seq) {
    return dao.myBookingList(member_seq);
  }

  public Member getMember(String email) {
    return dao.getMember(email);
  }

  public int passwordMatch(String email, String password) {
    return dao.passwordMatch(email, password);
  }

  public int join(String email, String password, String name, String phone, String nickname) {
    return dao.join(email, password, name, phone, nickname);
  }

  public int emailCheck(String email) {
    return emailCheck(email, null);
  }

  public int emailCheck(String email, String name) {
    return dao.emailCheck(email, name);
  }

  public int phoneCheck(String phone) {
    return dao.phoneCheck(phone);
  }

  public String findId(String name, long phoneNum) {
    return dao.findId(name, phoneNum);
  }

  public Member getMemberByEmail(String email, String name) {
    return dao.getMemberByEmail(email, name);
  }

  public Board reservedS(int memberSeq) {
    return dao.reserved(memberSeq);
  }
}
