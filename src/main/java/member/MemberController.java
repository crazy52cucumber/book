package member;

import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.SUCCESS;
import static member.util.SignupConst.VALID;

import domain.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
        }
      }
      req.getRequestDispatcher("/WEB-INF/jsp/main/main.jsp").forward(req, res);
    }
    req.getRequestDispatcher("/WEB-INF/jsp/main/main.jsp").forward(req, res);
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
      System.out.println("[MemberController] match 메소드에서 result: " + result);
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
      long phoneNum = Long.parseLong(phone);
      MemberService service = MemberService.getInstance();
      String myEmail = service.findId(name, phoneNum);
      if (myEmail != null) {
      email = "**"+myEmail.substring(2);
      }else {
        email = myEmail;
      }
    }
    req.setAttribute("email", email);
    req.getRequestDispatcher("/WEB-INF/jsp/member/my_id.jsp").forward(req, res);
  }
}
