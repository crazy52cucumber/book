package main;

import domain.Main;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import static main.util.MainSQL.*;

public class MainDAO {
    private DataSource ds;

    public MainDAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            ds = (DataSource) envContext.lookup("dbcp");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    ArrayList<Main> mainPage() { // mainPage 불러오는 데이터 처리
        ArrayList<Main> list = new ArrayList<>();
        Main mainDto = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = SELECT_ALL;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                long board_seq = rs.getLong("br.board_seq");
                String academy_name = rs.getString("br.academy_name");
                String addr = rs.getString("br.addr");
                String content = rs.getString("br.content");
                int book_limit = rs.getInt("br.book_limit");
                Date ldate = rs.getDate("br.ldate");
                double rate = rs.getDouble("rate");
                int review_count = rs.getInt("review_count");

                mainDto = new Main(board_seq, academy_name, addr, content, book_limit, ldate, rate, review_count);
                list.add(mainDto);
            }
            return list;
        } catch (SQLException se) {
            se.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException se2) {
                se2.printStackTrace();
            }
        }
    }

    int count_academy() {
        int count_academy = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = COUNT_ACADEMY;
        ResultSet rs = null;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count_academy = rs.getInt("count");
            }
            return count_academy;
        } catch (SQLException se) {
            se.printStackTrace();
            return -1;
        } finally {
            try {
                rs.close();
                pstmt.close();
                con.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    ArrayList<Main> search(String acd_name) {
        ArrayList<Main> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = AUTO_SEARCH;
        ResultSet rs = null;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+acd_name+"%");
            rs = pstmt.executeQuery();
            Main dto = null;
            while (rs.next()) {
                long board_seq = rs.getLong("board_seq");
                String academy_name = rs.getString("academy_name");
                String addr = rs.getString("addr");
                String phone_num = rs.getString("phone_num");
                Date edate = rs.getDate("edate");
                Date ldate = rs.getDate("ldate");
                String grade = rs.getString("grade");
                String subject = rs.getString("subject");
                String content = rs.getString("content");
                int book_limit = rs.getInt("book_limit");

                dto = new Main(board_seq, academy_name, addr, phone_num, edate, ldate, grade,
                        subject, content, book_limit);
                list.add(dto);
            }
            return list;
        } catch (SQLException se) {
            se.printStackTrace();
            return null;
        } finally {
            try {
                rs.close();
                pstmt.close();
                con.close();
            } catch (SQLException se2) {
                se2.printStackTrace();
            }
        }
    }
    ArrayList<Main> searchAcademy(String acd_name){ // mainPage 불러오는 데이터 처리
        ArrayList<Main> list = new ArrayList<>();
        Main mainDto = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = SEARCH_ACADEMY;
        ResultSet rs = null;

        try{
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+acd_name+"%");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                long board_seq = rs.getLong("board_seq");
                String academy_name = rs.getString("academy_name");
                String addr = rs.getString("addr");
                String content = rs.getString("content");
                int book_limit = rs.getInt("book_limit");
                Date ldate = rs.getDate("ldate");
                double rate = rs.getDouble("rate");
                int review_count = rs.getInt("review_count");

                mainDto = new Main(board_seq, academy_name, addr,content, book_limit, ldate,rate, review_count);
                list.add(mainDto);
            }
            return list;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            }catch (SQLException se2){
                se2.printStackTrace();
            }
        }
    }
    int count_search_academy(String acd_name){
        int csa = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = COUNT_SEARCH_ACADEMY;
        ResultSet rs = null;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+acd_name+"%");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                csa = rs.getInt("count");
            }
            return csa;
        }catch (SQLException se){
            se.printStackTrace();
            return -1;
        }finally {
            try{
                rs.close();
                pstmt.close();
                con.close();
            }catch (SQLException se){
                se.printStackTrace();
            }
        }
    }
}
