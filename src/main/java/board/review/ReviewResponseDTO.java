package board.review;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Builder
@Getter
@ToString
public class ReviewResponseDTO {
  private long reviewSeq, memberSeq, boardSeq, bookSeq;
  private int rate, count;
  private String nickname, title, grade, pros, cons, features, wishes;
  private Date cdate;

  public void setCdate(Date cdate) {
    this.cdate = cdate;
  }

}
