package main;

import domain.Main;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = {"/",""},loadOnStartup = 1)
public class MainController extends HttpServlet {

    private ServletContext context;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String param = req.getParameter("");

        if(param != null && param.isEmpty()) {
            param = param.trim();
            switch (param) {}
        }else
            list(req,res);
    }

    private void list(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{
        MainService service = MainService.getInstance();

        ArrayList<Main> list = service.mainPageS();
        int count = service.count_academyS();

        req.setAttribute("list", list);
        req.setAttribute("count", count);

        String view = "index.jsp";
        req.getRequestDispatcher(view).forward(req, res);
    }

}
