package book;

import book.util.BookConst;
import domain.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet("/book/*")
public class BookController extends HttpServlet {
    private BookService bookService;

    public BookController() {
        bookService = BookService.getInstance();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uri = req.getRequestURI();
        long memberPk = -1L;
        int result = 0;
        HttpSession session = req.getSession(false);
        Member member = (Member) session.getAttribute("member");
        req.setAttribute("member", member);

        if (member != null) {
            memberPk = member.getSeq();
        }
        try {
            long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
            int bookOk = bookService.getBookUser(memberPk, boardPk);
            int cancelOk = bookService.getCancelBook(memberPk, boardPk);

            //신규예약
            if (cancelOk == BookConst.LOGIN_NO) {
                result = bookService.insertBook(memberPk, boardPk);
            }
            //예약취소
            if (cancelOk == BookConst.BOOk_NO) {
                result = bookService.updateBook(memberPk, boardPk);
            }
            //재예약
            if (cancelOk == BookConst.CANCEL_YES) {
                result = bookService.reUpdateBook(memberPk, boardPk);
            }
            res.getWriter().print("{\"result\":\"" + result + "\"}");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }
}