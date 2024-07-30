package member;

import domain.Board;
import domain.Member;
import domain.Reply;
import lombok.Getter;

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

    public ArrayList<Reply> myReplyListS(int member_seq) {
        return dao.myReplyList(member_seq);
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

  public int join(String email, String password, String name, int phoneNum, String nickname) {
    return dao.join(email, password, name, phoneNum, nickname);
  }

  public int emailCheck(String email) {
    return dao.emailCheck(email);
  }

  public String findId(String name, long phoneNum) {
    return dao.findId(name, phoneNum);
  }
}
