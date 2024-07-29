<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --swiper-theme-color: #007aff;
        }

        :root {
            --max-width: 600px;
        }

        html,
        body {
            min-height: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        :root {
            view-transition-name: root;
        }

        html {
            display: block;
        }

        nav {
            border: 1px solid #000;
            box-sizing: border-box;
        }

        @media (min-width: 600px) {
            body {
                margin: 0 auto !important;
            }
        }

        .search-input {
            border-radius: 30px;
            border: 1px solid #1263be;
            background: #ffffff;
        }

        .login-header {
            border: 1px solid red;
        }

        .container {
            border: 1px solid #007aff;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            border: 1px solid red;
        }

        .header-text {
        }

        .main {
            border: 1px solid green;
            background: #b2b3ec;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        fieldset {
            display: flex;
            justify-content: center;
            margin: 10px;
            padding: 10px 12px;
        }

        input {
            width: 15rem;
            height: 2rem;
            border: none;
            border-radius: 20px;
        }

        input:focus {
            outline: none;
        }

        .login {
            cursor: pointer;
            width: 16.3rem;
            height: 3rem;
            border: none;
            border-radius: 20px;
        }

        .logo {
        }

        .hide {
            display: none;
        }
    </style>
</head>
<body>
<table border="2" width = "600" align ="center">
    <tr size = "2" align ="center">
        <th>번호</th>
        <th>학원명</th>
        <th>주소</th>
        <th>전화번호</th>
        <th>강의일</th>
        <th>설립일</th>
        <th>대상</th>
        <th>과목</th>
        <th>설명</th>
        <th>최대인원</th>
    </tr>
    <tr align = "center">
        <c:if test = "${empty list}">
        <tr>
            <td> No data
            </td>
        </tr>
        </c:if>
    <c:forEach items="${list}" var="board">
    <tr align='center' noshade>
        <TD>${board.board_seq}</TD>
        <TD>${board.academy_name}</TD>
        <TD>${board.addr}</TD>
        <TD>${board.phone_num}</TD>
        <TD>${board.edate}</TD>
        <TD>${board.ldate}</TD>
        <TD>${board.grade}</TD>
        <TD>${board.subject}</TD>
        <TD>${board.content}</TD>
        <TD>${board.book_limit}</TD>
    </tr>
</table>

</body>

</html>