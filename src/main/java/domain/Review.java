package domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@AllArgsConstructor
public class Review {
  private int replay_seq;
  private int rate;
  private String title;
  private String pros;
  private String cons;
  private String features;
  private String wishes;
  private Date cdate;
  private int valid;
  private int book_seq;
  private int member_seq;
}
