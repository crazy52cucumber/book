package member;

import static member.util.SignupConst.FAILURE;
import static member.util.SignupConst.SUCCESS;

import domain.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
        }
      }
      req.getRequestDispatcher("/").forward(req, res);
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
}
