package main;

import domain.Main;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String m = req.getParameter("m");
        if (m != null) {
            m = m.trim();
            switch (m) {
                case "list": mainPage(req, res); break;
                case "search" : search(req, res); break;
            }
        }else
            mainPage(req, res);
    }

    private void mainPage(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{
        MainService service = MainService.getInstance();

        ArrayList<Main> main = service.mainPageS();

        String view = "list.jsp";
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, res);
    }

    private void search(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        MainService service = MainService.getInstance();

        String acd_name = req.getParameter("academy_name");
        ArrayList<Main> list = service.searchS(acd_name);

        String view = "autosearch.jsp";
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, res);
    }
}
