package board;

import java.sql.Date;

public class BoardRequestDTO {
  private int boardSeq;
  private String academyName;
  private String addr;
  private String phone_num;
  private Date edate; // 설립일
  private Date ldate; // 강의일
  private String grade;
  private String subject;
  private String content;
  private int bookLimit;
}