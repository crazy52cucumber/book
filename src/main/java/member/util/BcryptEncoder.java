package member.util;

import static member.util.SignupConst.NOPASSWORD;
import static member.util.SignupConst.SUCCESS;


import org.mindrot.jbcrypt.BCrypt;

public abstract class BcryptEncoder {

  public static String encode(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  public static int isPasswordMatch(String password, String hashedPassword) {
    if (BCrypt.checkpw(password, hashedPassword)) {
      return SUCCESS;
    }
    return NOPASSWORD;
  }
}