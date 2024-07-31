package book;

import domain.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
        HttpSession session = req.getSession(false);
        Member member = (Member) session.getAttribute("member");
        if (member != null) {
            memberPk = member.getSeq();
        }

        try {
            long boardPk = Long.parseLong(uri.substring(uri.lastIndexOf('/') + 1));
            int result = insertBook(req, res, memberPk, boardPk);


            res.getWriter().print("{\"result\":\"" + result + "\"}");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

    private int insertBook(HttpServletRequest req, HttpServletResponse res, long memberPk, long boardPk) {
        return bookService.insertBook(memberPk, boardPk);
    }
}