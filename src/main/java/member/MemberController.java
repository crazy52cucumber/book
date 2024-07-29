package member;

import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.SUCCESS;

import domain.Board;
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

  public void service(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String m = req.getParameter("method");
    if (m != null) {
      m = m.trim();
      switch (m) {
        case "login":
          login(req, res);
          break;
        case "match":
          match(req, res);
          break;
        case "joinForm":
          joinForm(req, res);
          break;
        case "join":
          join(req, res);
          break;
        case "modify":
          modify(req, res);
          break;
        case "withdraw":
          withdraw(req, res);
          break;
        case "myReviewList":
          myReplyList(req, res);
          break;
        case "myBookingList":
          myBookingList(req, res);
          break;

        case "myPage":
          myPage(req, res);
          break;
      }
    } else {
      req.getRequestDispatcher("/").forward(req, res);
    }
    //req.getRequestDispatcher("/").forward(req, res);
  }


  //로그인
  private void login(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/login.jsp").forward(req, res);
  }

  //로그인 인증
  private void match(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("login-email");
    String password = req.getParameter("login-password");
    MemberService service = MemberService.getInstance();
    if (email != null && password != null) {
      int result = service.passwordMatch(email, password);
      if (result == SUCCESS) {
        Member member = service.getMember(email);
        HttpSession session = req.getSession();
        session.setAttribute("member", member);
      }
      System.out.println("result: " + result);
      req.setAttribute("result", result);
      req.getRequestDispatcher("/WEB-INF/jsp/member/message.jsp").forward(req, res);
    }
  }

  //회원가입 뷰로 가기
  private void joinForm(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/join_form.jsp").forward(req, res);
  }

  //회원가입
  private void join(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String name = req.getParameter("name");
    String nickname = req.getParameter("nickname");
    MemberService service = MemberService.getInstance();
    if (email != null && password != null && name != null && nickname != null) {
      int result = service.join(email, password, name, nickname);
      if (result != FAILURE) {
        Member member = service.getMember(email);
        HttpSession session = req.getSession();
        session.setAttribute("member", member);
      }
      req.setAttribute("result", result);
      req.getRequestDispatcher("/WEB-INF/jsp/member/join_message.jsp").forward(req, res);
    }
  }

  private void myPage(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    if (member != null) { //얘 필요 없나?
      req.setAttribute("member", member);
    }
    req.getRequestDispatcher("/WEB-INF/jsp/member/my_page.jsp").forward(req, res);

    //String view = "my_page.jsp";
    //RequestDispatcher rd = req.getRequestDispatcher(view);
    //rd.forward(req, res);
  }

  //회원정보 수정
  private void modify(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    int member_seq = member.getMember_seq();
    String email = member.getEmail();
    String password = req.getParameter("modifiedPassword");
    String name = member.getName();
    String phone = member.getPhone();
    String nickname = req.getParameter("nickname");

    Date rdate = member.getRdate();
    byte user_type = member.getUser_type();
    byte valid = member.getValid();
    Member modifiedMember = Member.builder()
            .member_seq(member_seq)
            .email(email)
            .password(password)
            .name(name)
            .phone(phone)
            .nickname(nickname)
            .rdate(rdate)
            .user_type(user_type)
            .valid(valid).build();

    //new Member(member_seq, email, password, name, phone, nickname, rdate, user_type, valid);

    MemberService service = MemberService.getInstance();
    service.modifyS(modifiedMember);

    //req.sendRedirect("my_page.jsp");
  }

  //회원 탈퇴
  private void withdraw(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    int member_seq = member.getMember_seq();
    boolean flag = false;
    if (member_seq != -1L) {
      MemberService service = MemberService.getInstance();
      service.withdrawS(member_seq);
    }
    req.setAttribute("flag", flag);

    String view = "mainPage.jsp";
    RequestDispatcher rd = req.getRequestDispatcher(view);
    rd.forward(req, res);
  }

  //내 리뷰리스트 불러오기
  private void myReplyList(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getMember_seq();

    MemberService service = MemberService.getInstance();
    ArrayList<Reply> myReplyList = service.myReplyListS(member_seq);
    req.setAttribute("myReplyList", myReplyList);

    String view = "my_reply_list.jsp";
    RequestDispatcher rd = req.getRequestDispatcher(view);
    rd.forward(req, res);
  }

  //내 예약리스트 불러오기
  // 예약 (중/ 취소/ 완료) //비동기 (검색 기능 / 라디오박스 같은 기능)
  //예약, 보드 조인해서 강의 리스트
  private void myBookingList(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getMember_seq();
    MemberService service = MemberService.getInstance();
    ArrayList<Board> myBookingList = service.myBookingListS(member_seq);
    req.setAttribute("myBookingList", myBookingList);

    String view = "my_booking_list.jsp";
    RequestDispatcher rd = req.getRequestDispatcher(view);
    rd.forward(req, res);
  }


}