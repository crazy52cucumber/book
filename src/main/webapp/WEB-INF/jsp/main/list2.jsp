<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
    <div class="main_wrap">
        <div class = "main_title">
            <strong>학원 안내</strong>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="board_num">번호</div>
                    <div class="academy_name">번호</div>
                    <div class="addr">주소</div>
                    <div class="edate">강의날짜</div>
                    <div class="ldate">설립일</div>
                    <div class="grade">등급</div>
                    <div class="subject">과목</div>
                    <div class="content">소개</div>
                    <div class="book_limit">최대인원</div>
                </div>
                <c:forEach items="list" var="board" varStatus="vs">
                    <div class="board_list_data">
                        <c:out value="${board.data}" escapeXml="false"/>
                        <div class="list_data">
                            <h4><c:out value="${board.academy_name}"/>${board.board_num}</h4>
                            <p><c:out value="${board.addr}"/></p>
                            <p><c:out value="${board.edate}"/></p><p><c:out value="${board.ldate}"/></p>
                            <p><c:out value="${board.grade}"/></p><p><c:out value="${board.subject}"/></p>
                            <p><c:out value="${board.content}"/></p>
                            <p><c:out value="${board.book_limit}"/></p>
                       </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>