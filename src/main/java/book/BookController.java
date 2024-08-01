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
        long review = -1L;
        int result = 0;
        HttpSession session = req.getSession(false);
        Member member = (Member) session.getAttribute("member");
        if (member != null) {
            review = member.getSeq();
        }
        try {
            long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
            int bookOk = bookService.getBookUser(review, boardPk);
            int cancelOk = bookService.getCancelBook(review, boardPk);
            System.out.println("cancelOk " + cancelOk);
            System.out.println("bookOk " + bookOk);
            //신규예약
            if (cancelOk == BookConst.LOGIN_NO) {
                System.out.println("insert");
                result = insertBook(req, res, review, boardPk);
            }
            //예약취소
            if (cancelOk == BookConst.BOOk_NO) {
                System.out.println("update");
                result = updateBook(req, res, review, boardPk);
            }
            //재예약
            if (cancelOk == BookConst.CANCEL_YES) {
                System.out.println("reUpdate");
                result = reUpdateBook(req, res, review, boardPk);
            }
            res.getWriter().print("{\"result\":\"" + result + "\"}");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

    private int insertBook(HttpServletRequest req, HttpServletResponse res, long review, long boardPk) {
        return bookService.insertBook(review, boardPk);
    }

    private int updateBook(HttpServletRequest req, HttpServletResponse res, long review, long boardPk) {
        return bookService.updateBook(review, boardPk);
    }

    private int reUpdateBook(HttpServletRequest req, HttpServletResponse res, long review, long boardPk) {
        return bookService.reUpdateBook(review, boardPk);
    }
}