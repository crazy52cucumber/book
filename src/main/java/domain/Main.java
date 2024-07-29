package domain;

import java.util.Date;

public class Main {
    private long board_seq; //보드번호
    private String academy_name; //학원명
    private String addr; //주소
    private String phone_num; // 전화번호
    private Date edate; // 설립일
    private Date ldate; // 강의일
    private String grade; // 등급
    private String subject; // 과목
    private String content; // 강의내용
    private int book_limit; // 최대예약인원

    public Main(){}

    public Main(long board_seq, String academy_name, String addr, String phone_num, Date edate, Date ldate, String grade, String subject, String content, int book_limit) {
        this.board_seq = board_seq;
        this.academy_name = academy_name;
        this.addr = addr;
        this.phone_num = phone_num;
        this.edate = edate;
        this.ldate = ldate;
        this.grade = grade;
        this.subject = subject;
        this.content = content;
        this.book_limit = book_limit;
    }

    // 게시판 관련 getter, setter
    public long getBoard_seq() {
        return board_seq;
    }

    public void setBoard_seq(long board_seq) {
        this.board_seq = board_seq;
    }

    public String getAcademy_name() {
        return academy_name;
    }

    public void setAcademy_name(String academy_name) {
        this.academy_name = academy_name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public Date getEdate() {
        return edate;
    }

    public void setEdate(Date edate) {
        this.edate = edate;
    }

    public Date getLdate() {
        return ldate;
    }

    public void setLdate(Date ldate) {
        this.ldate = ldate;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getBook_limit() {
        return book_limit;
    }

    public void setBook_limit(int book_limit) {
        this.book_limit = book_limit;
    }
}




