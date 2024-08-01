package board;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Builder
@Getter
@ToString
public class BoardResponseDTO {
  private int boardSeq;
  private String academyName;
  private String addr;
  private String phoneNum;
  private Date edate; // 설립일
  private Date ldate; // 강의일
  private String grade;
  private String subject;
  private String content;
  private int bookLimit;
  private int valid;
}
