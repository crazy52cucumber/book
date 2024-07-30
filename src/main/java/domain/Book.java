package domain;

import java.sql.Date;

public class Book {
    private int book_seq;
    private Date bDate;
    private int cancel_YN;
    private Date cDate;
    private int member_seq;
    private int board_seq;

    public Book(int book_seq, Date bDate, int cancel_YN, Date cDate, int member_seq, int board_seq) {
        this.book_seq = book_seq;
        this.bDate = bDate;
        this.cancel_YN = cancel_YN;
        this.cDate = cDate;
        this.member_seq = member_seq;
        this.board_seq = board_seq;
    }

    public int getBook_seq() {
        return book_seq;
    }

    public void setBook_seq(int book_seq) {
        this.book_seq = book_seq;
    }

    public Date getbDate() {
        return bDate;
    }

    public void setbDate(Date bDate) {
        this.bDate = bDate;
    }

    public int getCancel_YN() {
        return cancel_YN;
    }

    public void setCancel_YN(int cancel_YN) {
        this.cancel_YN = cancel_YN;
    }

    public Date getcDate() {
        return cDate;
    }

    public void setcDate(Date cDate) {
        this.cDate = cDate;
    }

    public int getMember_seq() {
        return member_seq;
    }

    public void setMember_seq(int member_seq) {
        this.member_seq = member_seq;
    }

    public int getBoard_seq() {
        return board_seq;
    }

    public void setBoard_seq(int board_seq) {
        this.board_seq = board_seq;
    }
}
