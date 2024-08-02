package member;

import static member.util.BcryptEncoder.encode;
import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.SUCCESS;
import static member.util.SignupConst.VALID;

import domain.Board;
import domain.Member;
import domain.Review;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

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

          case "startModify":
            startModify(req, res);
            break;

          case "modifyForm":
            modifyForm(req, res);
            break;

          case "modifyCheck":
            modifyCheck(req, res);
            break;

          case "modify":
            modify(req, res);
            break;
          //수정 전 비번 확인
          case "passwordCheck":
            passwordCheck(req, res);
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

          case "reserved1":
            reserved1(req, res);
            break;

          case "reserved2":
            reserved2(req, res);
            break;

          case "myPage":
            myPage(req, res);
            break;

          case "findPwd":
            findPwd(req, res);
            break;

          case "modifyPwd":
            modifyPwd(req, res);
            break;

          case "myPwd":
            try {
              myPwd(req, res);
            } catch (Exception e) {
              System.out.println("오류");
              throw new RuntimeException(e);
            }
            break;

          case "authEmail":
            try {
              authEmail(req, res);
            } catch (Exception e) {
              throw new RuntimeException(e);
            }
            break;
          case "emailNameCheck":
            emailNameCheck(req, res);
            break;

          case "memberCheck":
            memberCheck(req, res);
            break;

          case "phoneCheck":
            phoneCheck(req, res);
            break;

          case "logout":
            logout(req, res);
            break;
        }
      }
      //req.getRequestDispatcher("/").forward(req, res);
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
        String mySeq = "" + member.getSeq();
        HttpSession session = req.getSession();
        Cookie loginCookie = new Cookie("mySeq", mySeq);
        loginCookie.setPath("/");
        loginCookie.setHttpOnly(true);
        //loginCookie.setSecure(true);
        res.addCookie(loginCookie);
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
    String email = req.getParameter("emailHidden");
    System.out.println("email:" + email);
    String password = req.getParameter("password");
    String name = req.getParameter("name");
    String phone = req.getParameter("phone");
    String nickname = req.getParameter("nickname");
    MemberService service = MemberService.getInstance();
    int result = -1;
    if (email != null && password != null && name != null && phone != null && nickname != null) {
      result = service.join(email, password, name, phone, nickname);
      if (result != FAILURE) {
        Member member = service.getMember(email);
        System.out.println("member =>>" + member);

        Cookie loginCookie = new Cookie("mySeq", member.getSeq() + "");
        loginCookie.setPath("/");
        loginCookie.setHttpOnly(true);
        res.addCookie(loginCookie);

        HttpSession session = req.getSession();
        session.setAttribute("member", member);
      }

    }
    req.setAttribute("result", result);
    req.getRequestDispatcher("/WEB-INF/jsp/member/join_message.jsp").forward(req, res);
  }

  private void emailCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("email");
    MemberService service = MemberService.getInstance();
    int valid = service.emailCheck(email);
    String json = "{\"valid\":" + valid + "}";
    res.setContentType("application/json;charset=UTF-8");
    res.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    out.print(json);
    out.flush();
    out.close();
  }

  private void phoneCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String phone = req.getParameter("phone");
    MemberService service = MemberService.getInstance();
    int valid = service.phoneCheck(phone);
    String json = "{\"valid\":" + valid + "}";
    res.setContentType("application/json;charset=UTF-8");
    res.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    out.print(json);
    out.flush();
    out.close();
  }

  private void memberCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    if (email != null && password != null) {
      MemberService service = MemberService.getInstance();
      int result = service.passwordMatch(email, password);
      String json = "{\"result\":" + result + "}";
      res.setContentType("application/json;charset=UTF-8");
      res.setCharacterEncoding("UTF-8");
      PrintWriter out = res.getWriter();
      out.print(json);
      out.flush();
      out.close();
    }
  }

  private void passwordCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    String email = member.getEmail();
    String password = req.getParameter("password");
    System.out.println("email: " + email + "password: " + password);
    if (email != null && password != null) {
      MemberService service = MemberService.getInstance();
      int result = service.passwordMatch(email, password);
      //System.out.println(result + "수완");
      String json = "{\"result\":" + result + "}";
      res.setContentType("application/json;charset=UTF-8");
      res.setCharacterEncoding("UTF-8");
      PrintWriter out = res.getWriter();
      out.print(json);
      out.flush();
      out.close();
    }
  }

  private void startModify(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/password_ok.jsp").forward(req, res);
  }

  private void modifyForm(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/member/modify.jsp").forward(req, res);
  }

  private void modifyCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String nickname = req.getParameter("nickname");
    String password = req.getParameter("password");
    if (nickname != null && password != null) {
      MemberService service = MemberService.getInstance();
      int result = service.passwordMatch(nickname, password);
      String json = "{\"result\":" + result + "}";
      res.setContentType("application/json;charset=UTF-8");
      res.setCharacterEncoding("UTF-8");
      PrintWriter out = res.getWriter();
      out.print(json);
      out.flush();
      out.close();
    }

  }

  private void emailNameCheck(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String email = req.getParameter("email");
    String name = req.getParameter("name");
    MemberService service = MemberService.getInstance();
    int valid = service.emailCheck(email, name);
    String json = "{\"valid\":" + valid + "}";
    res.setContentType("application/json;charset=UTF-8");
    res.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    out.print(json);
    out.flush();
    out.close();
  }

  private void authEmail(HttpServletRequest req, HttpServletResponse res)
          throws Exception {
    String email = req.getParameter("email");
    String code = null;
    if (email != null) {
      MailService mailService = new MailService();
      code = mailService.sendEmail(email);
    }

    String json = "{\"code\":\"" + code + "\",\"email\":\"" + email + "\"}";
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

    //String view = "my_page.jsp";
    //RequestDispatcher rd = req.getRequestDispatcher(view);
    //rd.forward(req, res);
  }

  //회원정보 수정
  private void modify(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getSeq();
    String email = member.getEmail();
    String password = encode(req.getParameter("modifiedPassword"));
    String name = member.getName();
    String phone = member.getPhone();
    String nickname = req.getParameter("modifiedNickname");
    System.out.println(nickname);
    System.out.println(password);

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

    MemberService service = MemberService.getInstance();
    service.modifyS(modifiedMember);

    req.getRequestDispatcher("/WEB-INF/jsp/member/my_page.jsp").forward(req, res);
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
    int totalMyBooking = service.countMyBookingS(member_seq);
    System.out.println("totalMyBooking: " + totalMyBooking);
    int rate = service.getRateS(member_seq);
    int reviews = service.getReviewsS(member_seq);
    req.setAttribute("myBookingList", myBookingList);
    req.setAttribute("totalMyBooking", totalMyBooking);

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
    String code = null;
    if (email != null && name != null) {
      MemberService service = MemberService.getInstance();
      member = service.getMemberByEmail(email, name);
      String myEmail = member.getEmail();
      if (myEmail != null) {
        MailService mailService = new MailService();
        code = mailService.sendEmail(myEmail);
      }
      req.setAttribute("email", myEmail);
      req.setAttribute("code", code);
      req.getRequestDispatcher("/WEB-INF/jsp/member/my_pwd.jsp").forward(req, res);
    }
  }

  private void modifyPwd(HttpServletRequest req, HttpServletResponse res)
          throws IOException, ServletException {
    String password = req.getParameter("password");
    String email = req.getParameter("hiddenEmail");
    MemberService service = MemberService.getInstance();
    int result = service.modify(email, password);
    req.setAttribute("result", result);
    req.getRequestDispatcher("/WEB-INF/jsp/member/modifyPwd_message.jsp").forward(req, res);
  }

  private void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
    HttpSession session = req.getSession(false);
    if (session != null) {
      session.invalidate();
      System.out.println("로그아웃");
    } else {
      System.out.println("session is null");
    }
    res.sendRedirect("/");
  }

  private void reserved1(HttpServletRequest req, HttpServletResponse res) {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getSeq();
    StringBuilder jsonBuilder = new StringBuilder();
    jsonBuilder.append("[");

    if (member_seq != -1) {
      MemberService service = MemberService.getInstance();
      List<Board> myReservedList = service.reservedS(member_seq);

      if (myReservedList != null && !myReservedList.isEmpty()) {
        boolean isFirst = true; // flag to handle commas between JSON objects
        for (Board reservedboard : myReservedList) {
          Date lDate = reservedboard.getlDate();
          if (lDate != null) {
            // Check if lDate is before the current time
            if (lDate.getTime() > System.currentTimeMillis()) {
              if (!isFirst) {
                jsonBuilder.append(","); // Add comma before appending new JSON object
              }
              jsonBuilder.append("{")
                      .append("\"board_seq\":").append(reservedboard.getBoard_seq()).append(",")
                      .append("\"academy_name\":\"").append(reservedboard.getAcademy_name()).append("\",")
                      .append("\"addr\":\"").append(reservedboard.getAddr()).append("\",")
                      .append("\"phone\":\"").append(reservedboard.getPhone_num()).append("\",")
                      .append("\"eDate\":\"").append(reservedboard.geteDate()).append("\",")
                      .append("\"lDate\":\"").append(reservedboard.getlDate()).append("\",")
                      .append("\"grade\":\"").append(reservedboard.getGrade()).append("\",")
                      .append("\"subject\":\"").append(reservedboard.getSubject()).append("\",")
                      .append("\"content\":\"").append(reservedboard.getContent()).append("\",")
                      .append("\"bookLimit\":\"").append(reservedboard.getBook_limit()).append("\",")
                      .append("\"valid\":\"").append(reservedboard.getValid()).append("\"")
                      .append("}");
              isFirst = false; // Ensure the comma is added only before subsequent objects
            }
          }
        }
      }
    }

    jsonBuilder.append("]");

    try {
      res.setContentType("application/json;charset=utf-8");
      PrintWriter pw = res.getWriter();
      pw.print(jsonBuilder.toString());
      pw.flush(); // Ensure all data is written out
      pw.close(); // Close the writer
    } catch (IOException ie) {
      ie.printStackTrace(); // Print exception stack trace for debugging
    }
  }

  private void reserved2(HttpServletRequest req, HttpServletResponse res) {
    HttpSession session = req.getSession(false);
    Member member = (Member) session.getAttribute("member");
    int member_seq = member.getSeq();
    StringBuilder jsonBuilder = new StringBuilder();
    jsonBuilder.append("[");

    if (member_seq != -1) {
      MemberService service = MemberService.getInstance();
      List<Board> myReservedList = service.reservedS(member_seq);

      if (myReservedList != null && !myReservedList.isEmpty()) {
        boolean isFirst = true; // flag to handle commas between JSON objects
        for (Board reservedboard : myReservedList) {
          Date lDate = reservedboard.getlDate();
          if (lDate != null) {
            // Check if lDate is before the current time
            if (lDate.getTime() < System.currentTimeMillis()) {
              if (!isFirst) {
                jsonBuilder.append(","); // Add comma before appending new JSON object
              }
              jsonBuilder.append("{")
                      .append("\"board_seq\":").append(reservedboard.getBoard_seq()).append(",")
                      .append("\"academy_name\":\"").append(reservedboard.getAcademy_name()).append("\",")
                      .append("\"addr\":\"").append(reservedboard.getAddr()).append("\",")
                      .append("\"phone\":\"").append(reservedboard.getPhone_num()).append("\",")
                      .append("\"eDate\":\"").append(reservedboard.geteDate()).append("\",")
                      .append("\"lDate\":\"").append(reservedboard.getlDate()).append("\",")
                      .append("\"grade\":\"").append(reservedboard.getGrade()).append("\",")
                      .append("\"subject\":\"").append(reservedboard.getSubject()).append("\",")
                      .append("\"content\":\"").append(reservedboard.getContent()).append("\",")
                      .append("\"bookLimit\":\"").append(reservedboard.getBook_limit()).append("\",")
                      .append("\"valid\":\"").append(reservedboard.getValid()).append("\"")
                      .append("}");
              isFirst = false; // Ensure the comma is added only before subsequent objects
            }
          }
        }
      }
    }

    jsonBuilder.append("]");

    try {
      res.setContentType("application/json;charset=utf-8");
      PrintWriter pw = res.getWriter();
      pw.print(jsonBuilder.toString());
      pw.flush(); // Ensure all data is written out
      pw.close(); // Close the writer
    } catch (IOException ie) {
      ie.printStackTrace(); // Print exception stack trace for debugging
    }
  }
}