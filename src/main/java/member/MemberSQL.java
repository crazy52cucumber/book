package member;

class MemberSQL {
  final static String MODIFY_INFO
          = "update MEMBER set PASSWORD=?, NICKNAME=?,  where MEMBER_SEQ = ?";

  final static String WITHDRAW
          = "update MEMBER set VALID= 1 where MEMBER_SEQ= ?";

  final static String MY_REPLY
          = "select * from REPLY r join BOOK b on r.book_seq = b.book_seq where MEMBER_SEQ= ?";

  final static String MY_BOOKING
          = "select * from BOARD b1 join BOOK b2 on b1.BOARD_SEQ = b2.BOARD_SEQ where MEMBER_SEQ= ?";
  //= "select board_seq from Book where MEMBER_SEQ= ?";


  public static final String EMAILNAME = "select * from MEMBER where EMAIL = ? and NAME = ? and VALID=0";
}
