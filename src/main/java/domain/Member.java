package domain;

import lombok.Getter;

import java.sql.Date;

public class Member {
    private int member_seq;
    private String email;
    @Getter
    private String password;
    private String name;
    private String nickname;
    private Date birth_day;
    private Date rdate;
    private int user_type;
    private int valid;


    public Member(int member_seq, String email, String password, String name, String nickname, Date birth_day, Date rdate, int user_type, int valid) {
        this.member_seq = member_seq;
        this.email = email;
        this.password = password;
        this.name = name;
        this.nickname = nickname;
        this.birth_day = birth_day;
        this.rdate = rdate;
        this.user_type = user_type;
        this.valid = valid;
    }

    public int getSeq() {
        return member_seq;
    }

    public void setSeq(int seq) {
        this.member_seq = member_seq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Date getBirth_day() {
        return birth_day;
    }

    public void setBirth_day(Date birth_day) {
        this.birth_day = birth_day;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }
}
