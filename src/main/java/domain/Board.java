package domain;

import java.sql.Date;

public class Board {
    private int board_seq;
    private String academy_name;
    private String addr;
    private String phone_num;
    private Date eDate;
    private Date lDate;
    private String grade;
    private String subject;
    private String content;
    private int book_limit;
    private int valid;

    public Board(int board_seq, String academy_name, String addr, String phone_num, Date eDate, Date lDate, String grade, String subject, String content, int book_limit, int valid) {
        this.board_seq = board_seq;
        this.academy_name = academy_name;
        this.addr = addr;
        this.phone_num = phone_num;
        this.eDate = eDate;
        this.lDate = lDate;
        this.grade = grade;
        this.subject = subject;
        this.content = content;
        this.book_limit = book_limit;
        this.valid = valid;
    }

    public int getBoard_seq() {
        return board_seq;
    }

    public void setBoard_seq(int board_seq) {
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

    public Date geteDate() {
        return eDate;
    }

    public void seteDate(Date eDate) {
        this.eDate = eDate;
    }

    public Date getlDate() {
        return lDate;
    }

    public void setlDate(Date lDate) {
        this.lDate = lDate;
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

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }
}
