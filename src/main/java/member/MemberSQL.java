package member;

class MemberSQL {

  final static String MODIFY_INFO
          = "update MEMBER set PASSWORD=?, NICKNAME=? where MEMBER_SEQ = ?";

  final static String WITHDRAW
          = "update MEMBER set VALID= 1 where MEMBER_SEQ= ?";

  final static String MY_REVIEW
          = "select * from REVIEW where MEMBER_SEQ= ?";

  final static String MY_BOOKING
          = "select * from BOARD b1 join BOOK b2 on b1.BOARD_SEQ = b2.BOARD_SEQ where MEMBER_SEQ= ?";

  static final String RESERVED = "select * from BOARD b1 join BOOK b2 on b1.BOARD_SEQ = b2.BOARD_SEQ where MEMBER_SEQ= ?";

  final static String COUNT_MYBOOKING = "select Count(*) from BOOK where MEMBER_SEQ = ?";

  final static String COUNT_MYREVIEW = "";

}
