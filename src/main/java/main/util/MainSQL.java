package main.util;

public class MainSQL {
    public static String SELECT_ALL = "select BR.BOARD_SEQ, BR.ACADEMY_NAME, BR.ADDR, BR.CONTENT,BR.BOOK_LIMIT, BR.LDATE, IFNULL(avg(RV.RATE),0) rate, count(REVIEW_SEQ) review_count\n" +
            "from BOARD BR LEFT OUTER JOIN BOOK BK\n" +
            "ON (\n" +
            "    BR.BOARD_SEQ = BK.BOARD_SEQ\n" +
            ")\n" +
            "LEFT OUTER JOIN REVIEW RV\n" +
            "ON(\n" +
            "    BK.BOOK_SEQ=RV.BOOK_SEQ\n" +
            ")\n" +
            "WHERE BR.VALID = 0\n" +
            "group by BOARD_SEQ\n" +
            "order by LDATE desc;";     // BOARD, BOOK, REVIEW를 LEFT OUTER JOIN하여 RATE의 평균 계산 (null은 제외)

    public static String COUNT_ACADEMY = "select count(*) as count from BOARD where VALID=0;";

    // search 기능용 SQL

    public static String AUTO_SEARCH = "select * from BOARD where ACADEMY_NAME like ? and VALID=0;";


    // 검색창
    public static String SEARCH_ACADEMY = "select BR.BOARD_SEQ, BR.ACADEMY_NAME, BR.ADDR, BR.CONTENT,BR.BOOK_LIMIT, BR.LDATE, IFNULL(avg(RV.RATE),0) rate, count(REVIEW_SEQ) review_count\n" +
            "from BOARD BR LEFT OUTER JOIN BOOK BK\n" +
            "ON(\n" +
            "    BR.BOARD_SEQ = BK.BOARD_SEQ\n" +
            ")\n" +
            "LEFT OUTER JOIN REVIEW RV\n" +
            "ON(\n" +
            "    BK.BOOK_SEQ=RV.BOOK_SEQ\n" +
            ")\n" +
            "where BR.ACADEMY_NAME like ? and BR.VALID = 0\n" +
            "group by BOARD_SEQ\n" +
            "order by LDATE desc;";

    public static String COUNT_SEARCH_ACADEMY = "select count(*) as count from BOARD where ACADEMY_NAME like ? and VALID=0;";
}

