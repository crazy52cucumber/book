package main;

import domain.Main;
import org.checkerframework.checker.units.qual.A;

import java.util.ArrayList;

public class MainService {
    private MainDAO dao;
    private static final MainService instance = new MainService();
    private MainService() {
        dao = new MainDAO();
    }

    public static MainService getInstance() {
        return instance;
    }

    public ArrayList<Main> mainPageS() {
        return dao.mainPage();
    }
    public int count_academyS(){
        return dao.count_academy();
    }

    // Search용 service
    public ArrayList<Main> searchS(String acd_name) {
        return dao.search(acd_name);
    }

    public ArrayList<Main> searchAcademyS(String acd_name) {
        return dao.searchAcademy(acd_name);
    }
    int count_search_academy(String acd_name){
        return dao.count_search_academy(acd_name);
    }

}
