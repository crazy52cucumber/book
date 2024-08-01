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
        String m = req.getParameter("m");
        if(m != null && m.isEmpty()) {
            m = m.trim();
            switch (m) {
                case "search": search(req, res); break;
                case "autocomplete":autocomplete(req,res); break;
            }
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

    private void search(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String searchJson = "";
        String acd_name = req.getParameter("acd_name");

        if(acd_name !=null) {
            acd_name.trim();
            MainService service = MainService.getInstance();
            ArrayList<Main> list = service.searchS(acd_name);
            if(list.size() != 0) {
                searchJson = "[";
                for(Main main: list) {
                    searchJson
                            += "{\"board_seq\":"+main.getBoard_seq()
                            +", \"academy_name\":\""+main.getAcademy_name()
                            +"\", \"addr\":\""+main.getAddr()
                            +"\", \"ldate\":\""+main.getLdate()
                            +"\"}";

                    searchJson += ",";
                }
                searchJson = searchJson.substring(0, searchJson.length()-1);
                searchJson += "]";
            }else {
                searchJson = "[]";
            }
        }else {
            searchJson = "[]";
        }

        try {
            res.setContentType("application/json:charset=utf-8");
            PrintWriter pw = res.getWriter();
            pw.print(searchJson);
        }catch(IOException ie) {
            ie.printStackTrace();
        }
    }
    private void autocomplete(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException{
//        String view = "WEB-INF/jsp/main/autosearch.jsp";
        String view = "index.jsp";
        res.sendRedirect(view);
    }

}
