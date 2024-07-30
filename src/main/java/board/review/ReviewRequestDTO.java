package board.review;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ReviewRequestDTO {
  private String title;
  private String pros;
  private String cons;
  private String features;
  private String wishs;
  private int rate;
}
