package member;

import domain.Board;
import domain.Member;
import domain.Reply;

import java.util.ArrayList;

public class MemberService {
    private MemberDAO dao;

    private static MemberService instance = new MemberService();

    private MemberService() {
        dao = new MemberDAO();
    }


    public static void setInstance(MemberService instance) {
        MemberService.instance = instance;
    }

    public static MemberService getInstance() {
        return instance;
    }

    public void modifyS(Member member) {
        dao.modify(member);
    }

    public void withdrawS(int seq) {
        dao.withdraw(seq);
    }


    public ArrayList<Reply> myReplyListS(int member_seq) {
        return dao.myReplyList(member_seq);
    }

    public ArrayList<Board> myBookingListS(int member_seq) {
        return dao.myBookingList(member_seq);
    }


}
