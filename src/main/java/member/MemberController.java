package member;

import domain.Board;
import domain.Book;
import domain.Member;
import domain.Reply;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet("/member/member.do")
public class MemberController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        if (m != null) {
            m = m.trim();
            switch (m) {
                case "modify":
                    modify(request, response);
                    break;
                case "withdraw":
                    withdraw(request, response);
                    break;
                case "myReviewList":
                    myReplyList(request, response);
                    break;
                case "myBookingList":
                    myBookingList(request, response);
                    break;

                default:
                    myPage(request, response);
            }
        } else {
            myPage(request, response);
        }
    }

    //나의 페이지 메인 화면
    private void myPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");

        if (member != null) { //얘 필요 없나?
            request.setAttribute("member", member);
        }

        String view = "/WEB-INF/jsp/member/my_page.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    private void modify(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");

        int member_seq = member.getSeq();
        String email = member.getEmail();
        String password = request.getParameter("modifiedPassword");
        String name = member.getName();
        String nickname = request.getParameter("nickname");
        Date birth_day = member.getBirth_day();
        Date rdate = member.getRdate();
        int user_type = member.getUser_type();
        int valid = member.getValid();
        Member modifiedMember = new Member(member_seq, email, password, name, nickname, birth_day, rdate, user_type, valid);

        MemberService service = MemberService.getInstance();
        service.modifyS(modifiedMember);

        response.sendRedirect("my_page.jsp");
    }

    private void withdraw(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");

        int member_seq = member.getSeq();
        boolean flag = false;
        if (member_seq != -1L) {
            MemberService service = MemberService.getInstance();
            service.withdrawS(member_seq);
        }
        request.setAttribute("flag", flag);

        String view = "mainPage.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    private void myReplyList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");
        int member_seq = member.getSeq();

        MemberService service = MemberService.getInstance();
        ArrayList<Reply> myReplyList = service.myReplyListS(member_seq);
        request.setAttribute("myReplyList", myReplyList);

        String view = "my_reply_list.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    //예약 (중/ 취소/ 완료) //비동기 (검색 기능 / 라디오박스 같은 기능)
    //예약, 보드 조인해서 강의 리스트
    private void myBookingList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("member");
        int member_seq = member.getSeq();
        MemberService service = MemberService.getInstance();
        ArrayList<Board> myBookingList = service.myBookingListS(member_seq);
        request.setAttribute("myBookingList", myBookingList);

        String view = "my_booking_list.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }


}