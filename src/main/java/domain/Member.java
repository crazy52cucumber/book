package domain;

import java.sql.Date;

import lombok.*;

@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@Getter
public class Member {
  private final int seq;
  private final String email;
  private final String password;
  private final String name;
  private final String nickname;
  private final Date rdate;
  private final byte user_type;
  private final byte valid;
}
