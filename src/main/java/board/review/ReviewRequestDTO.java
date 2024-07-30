package board.review;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class ReviewRequestDTO {
  private String title;
  private String pros;
  private String cons;
  private String features;
  private String wishes;
  private int rate;
  private long boardSeq;
  private long memberSeq;

  public void setBoardSeq(long boardSeq) {
    this.boardSeq = boardSeq;
  }

  public void setMemberSeq(long memberSeq) {
    this.memberSeq = memberSeq;
  }
}
