package domain;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

import lombok.*;

@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@Getter
@Setter
public class Member {
  private final int seq;
  private final String email;
  private final String password;
  private final String name;
  private final int phone;
  private final String nickname;
  private final Date rdate;
  private final byte user_type;
  private final byte valid;
}
