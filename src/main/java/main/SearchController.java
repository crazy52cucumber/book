package main;

import domain.Main;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/search/*")
public class SearchController extends HttpServlet {

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String m = req.getParameter("m");

        if(m != null) {
            m = m.trim();
            switch (m) {
                case "search":
                    search(req, res);
                    break;
                case "autocomplete":
                    autocomplete(req, res);
                    break;
                case "sendAutocomplete":
                    sendAutocomplete(req, res);
                    break;
            }
        }
    }
    // 검색 후 list reload
    private void search(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{
        String acd_name = req.getParameter("acd_name");

        MainService service = MainService.getInstance();
        ArrayList<Main> list = service.searchAcademyS(acd_name);
        int count = service.count_search_academy(acd_name);

        req.setAttribute("list", list);
        req.setAttribute("count", count);

        String view = "index.jsp";
        req.getRequestDispatcher(view).forward(req, res);
    }
    
    // 검색창 기능용
    private void autocomplete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
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
    private void sendAutocomplete(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{
        String view = "WEB-INF/jsp/main/autosearch.jsp";
//        String view = "index.jsp";
        res.sendRedirect(view);
    }
}



