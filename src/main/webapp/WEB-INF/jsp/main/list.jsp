<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/main/test.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous"></script>
</head>
<main>
    <body>
    <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    <div class="main_wrap">
        <div class = "main_title">
            <strong>학원 안내</strong>
        </div>
     <div class="board_list_wrap">
        <div class="board_list">
<%--            <div class="top">--%>
<%--                <div class="board_num">번호</div>--%>
<%--                <div class="academy_name">번호</div>--%>
<%--                <div class="addr">주소</div>--%>
<%--                <div class="edate">강의날짜</div>--%>
<%--                <div class="ldate">설립일</div>--%>
<%--                <div class="grade">등급</div>--%>
<%--                <div class="subject">과목</div>--%>
<%--                <div class="content">소개</div>--%>
<%--                <div class="book_limit">최대인원</div>--%>
<%--            </div>--%>
            <div>
                <c:forEach items="${list}" var="board">
                    <div class="board_num">${board.board_seq}</div>
                    <div class="academy_name">${board.academy_name}</div>
                    <div class="addr">${board.addr}</div>
                    <div class="edate">${board.edate}</div>
                    <div class="ldate">${board.ldate}</div>
                    <div class="grade">${board.grade}</div>
                    <div class="subject">${board.subject}</div>
                    <div class="content">${board.content}</div>
                    <div class="book_limit">${board.book_limit}</div>
                </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
    </body>
</main>
</html>