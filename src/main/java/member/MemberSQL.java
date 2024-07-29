package member;

class MemberSQL {
    final static String MODIFY_INFO
            = "update MEMBER set PASSWORD=?, NICKNAME=?,  where MEMBER_SEQ = ?";

    final static String WITHDRAW
            = "update MEMBER set VALID= 1 where MEMBER_SEQ= ?";

    final static String MY_REPLY
            = "select * from REPLY where MEMBER_SEQ= ?";

    final static String MY_BOOKING1
            = "select * from BOOK where MEMBER_SEQ= ?";
            //= "select board_seq from Book where MEMBER_SEQ= ?";

    final static String MY_BOOKING2
            = "select * from BOOK where BOARD_SEQ= ?";
}
