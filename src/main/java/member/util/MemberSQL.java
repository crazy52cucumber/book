package member.util;

public class MemberSQL {

  public static final String PASSWORDMATCH = "select PASSWORD from MEMBER where EMAIL = ?";

  public static final String GETMEMBER = "select * from MEMBER where EMAIL = ?";

  public static final String JOIN = "insert into MEMBER(EMAIL,PASSWORD,NAME,PHONE,NICKNAME,RDATE,USER_TYPE,VALID) values(?,?,?,?,?,now(),0,0)";

  public static final String EMAILCHECK = "select VALID from MEMBER where EMAIL = ? and VALID=0";
  public static final String PHONECHECK = "select VALID from MEMBER where PHONE = ? and VALID=0";

  public static final String EMAILNAMECHECK = "select VALID from MEMBER where EMAIL = ? and NAME =? and VALID=0";

  public static final String FINDID = "select EMAIL from MEMBER where NAME=? and PHONE=? and VALID=0";

  public static final String MODIFYPASSWORD = "update MEMBER set PASSWORD=? where EMAIL=? and VALID=0";
}
