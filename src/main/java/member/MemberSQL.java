package member;

class MemberSQL {

  final static String MODIFY_INFO
          = "update MEMBER set PASSWORD=?, NICKNAME=? where MEMBER_SEQ = ?";

  final static String WITHDRAW
          = "update MEMBER set VALID= 1 where MEMBER_SEQ= ?";

  final static String MY_REVIEW1
          = "select * from REVIEW where MEMBER_SEQ= ?";

  final static String MY_REVIEW =
          "select * from member m join book b on m.member_seq = b.member_seq join review r on r.book_seq = b.book_seq join board boa on boa.board_seq = b.board_seq where m.member_seq = ?";

  final static String MY_BOOKING
          = "select * from BOARD b1 join BOOK b2 on b1.BOARD_SEQ = b2.BOARD_SEQ where MEMBER_SEQ= ? and cancel_YN = 0";

  static final String RESERVED = "select * from BOARD b1 join BOOK b2 on b1.BOARD_SEQ = b2.BOARD_SEQ where MEMBER_SEQ= ? and cancel_YN = 0";

  final static String COUNT_MYBOOKING = "select Count(*) from BOOK where MEMBER_SEQ = ? and cancel_YN = 0";

  final static String COUNT_MYREVIEW = "";

}