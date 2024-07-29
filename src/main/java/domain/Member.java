package domain;

import java.sql.Date;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.ToString;

@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
public class Member {

  private final int seq;
  private final String email;
  private final String password;
  private final String name;
  private final int PHONE;
  private final String nickname;
  private final Date rdate;
  private final byte user_type;
  private final byte valid;
}
