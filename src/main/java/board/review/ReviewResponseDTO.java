package board.review;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Builder
@Getter
@ToString
public class ReviewResponseDTO {
  private long replySeq, memberSeq, boardSeq, bookSeq;
  private int rate, count;
  private String nickname, title, grade;
  private Date cdate;
}
