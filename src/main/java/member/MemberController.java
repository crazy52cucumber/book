package member;

import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.SUCCESS;
import static member.util.SignupConst.VALID;

import domain.Board;
import domain.Member;
import domain.Review;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet("/member/member.do")
public class MemberController extends HttpServlet {

  public void service(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String method = req.getParameter("method");
    if (method != null) {
      if (!method.isBlank()) {
        switch (method) {
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

          case "emailCheck":
            emailCheck(req, res);
            break;

          case "findId":
            findId(req, res);
            break;

          case "myId":
            myId(req, res);
            break;

          case "modify":
            modify(req, res);
            break;

          case "modifyCheck":
            modifyCheck(req, res);
            break;

          case "modifyPopup":
            modifyPopup(req,res);
            break;

          case "popup":
            popup(req, res);
            break;

          case "withdraw":
            withdraw(req, res);
            break;

          case "myReviewList":
            myReviewList(req, res);
            break;

          case "myBookingList":
            myBookingList(req, res);
            break;

          case "myPage":
            myPage(req, res);
            break;

          case "findPwd":
            findPwd(req, res);
            break;

          case "myPwd":
            try {
              myPwd(req, res);
            } catch (Exception e) {
              System.out.println("오류");
              throw new RuntimeException(e);
            }
            break;
        }
      }
      //req.getRequestDispatcher("/").forward(req, res);
    }
    req.getRequestDispatcher("/").forward(req, res);
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
    String phone = req.getParameter("phone");
    String nickname = req.getParameter("nickname");
    MemberService service = MemberService.getInstance();
    if (email != null && password != null && name != null && phone != null && nickname != null) {
      int phoneNum = Integer.parseInt(phone);
      int result = service.join(email, password, name, phoneNum, nickname);
      if (result != FAILURE) {
        Member member = service.getMember(email);
        HttpSession session = req.getSession();
        session.setAttribute("member", member);
      }
      req.setAttribute("result", result);
      req.getRequestDispatcher("/WEB-INF/jsp/member/join_message.jsp").forward(req, res);
    }
  }

  private void emailCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("email");
    System.out.println("email: " + email);
    MemberService service = MemberService.getInstance();
    int valid = service.emailCheck(email);
    System.out.println("valid: " + valid);
    String json = "{\"valid\":" + valid + "}";
    res.setContentType("application/json;charset=UTF-8");
    res.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    out.print(json);
    out.flush();
    out.close();
  }

  private void myPage(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    if (member != null) { //얘 필요 없나?
      req.setAttribute("member", member);
    }
    req.getRequestDispatcher("/WEB-INF/jsp/member/my_page.jsp").forward(req, res);
  }

  //회원정보 수정
  private void modify(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    int member_seq = member.getSeq();
    String email = member.getEmail();
    String password = req.getParameter("modifiedPassword");
    String name = member.getName();
    int phone = member.getPhone();
    String nickname = req.getParameter("nickname");

    Date rdate = member.getRdate();
    byte user_type = member.getUser_type();
    byte valid = member.getValid();
    Member modifiedMember = Member.builder()
            .seq(member_seq)
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
  }

  private void modifyCheck(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    String userPwd = member.getPassword();
    String inputPwd = req.getParameter("password");
    if (userPwd != null && userPwd.equals(inputPwd)) {
      req.getRequestDispatcher("/WEB-INF/jsp/member/modify.jsp").forward(req, res);
    }else{
      req.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
      req.getRequestDispatcher("/WEB-INF/jsp/member/modifyCheck.jsp").forward(req, res);
    }


  }

  private void modifyPopup(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/modifyCheck.jsp").forward(req, res);
  }

  private void popup(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/modify.jsp").forward(req, res);
  }

  //회원 탈퇴
  private void withdraw(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");

    int member_seq = member.getSeq();
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
  private void myReviewList(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member loginMember = (Member) session.getAttribute("member");
    int member_seq = loginMember.getSeq();
    //System.out.println(member_seq);
    MemberService service = MemberService.getInstance();
    ArrayList<Review> myReviewList = service.myReviewListS(member_seq);
    req.setAttribute("loginMember", loginMember);
    req.setAttribute("myReviewList", myReviewList);


    req.getRequestDispatcher("/WEB-INF/jsp/member/my_review_list.jsp").forward(req, res);
  }

  private void findId(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/find_id.jsp").forward(req, res);
  }

  private void myId(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String name = req.getParameter("name");
    String phone = req.getParameter("phone");
    System.out.println("name: " + name);
    System.out.println("phone: " + phone);
    String email = null;
    if (name != null && phone != null) {
      int phoneNum = Integer.parseInt(phone);
      MemberService service = MemberService.getInstance();
      String myEmail = service.findId(name, phoneNum);
      if (myEmail != null) {
        email = "**" + myEmail.substring(2);
      } else {
        email = myEmail;
      }
    }
    req.setAttribute("email", email);
    req.getRequestDispatcher("/WEB-INF/jsp/member/my_id.jsp").forward(req, res);
  }

  //내 예약리스트 불러오기
  // 예약 (중/ 취소/ 완료) //비동기 (검색 기능 / 라디오박스 같은 기능)
  //예약, 보드 조인해서 강의 리스트
  private void myBookingList(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getSeq();
    MemberService service = MemberService.getInstance();
    ArrayList<Board> myBookingList = service.myBookingListS(member_seq);
    req.setAttribute("myBookingList", myBookingList);

    req.getRequestDispatcher("/WEB-INF/jsp/member/my_booking_list.jsp").forward(req, res);
  }

  private void findPwd(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/find_pwd.jsp").forward(req, res);
  }

  private void myPwd(HttpServletRequest req, HttpServletResponse res)
          throws Exception {
    String email = req.getParameter("email");
    String name = req.getParameter("name");
    Member member = null;
    if (email != null && name != null) {
      MemberService service = MemberService.getInstance();
      member = service.getMemberByEmail(email, name);
      MailService mailService = new MailService();
      String authenticationCode = mailService.sendEmail(member.getEmail());
      HttpSession session = req.getSession();
      session.setAttribute("member", member);
      session.setAttribute("authenticationCode", authenticationCode);
      req.getRequestDispatcher("/WEB-INF/jsp/member/my_id.jsp").forward(req, res);
    }
  }

}