package domain;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Getter
@ToString
@Builder
public class Member {
  private final int member_seq;
  private final String email;
  private final String password;
  private final String name;
  private final String phone;
  private final String nickname;
  private final Date rdate;
  private final byte user_type;
  private final byte valid;


}