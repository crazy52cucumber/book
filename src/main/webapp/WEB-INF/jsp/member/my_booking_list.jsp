<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-26
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {
            text-decoration: none;
            text-align: center;
        }

        #container {
            display: flex;
            justify-content: center;
            width: 100vw;
            height: 100vw;
        }

        #layout {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: bisque;
            width: 500px;
            height: auto;
            margin-top: 50px;
        }

        #btns {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="layout">
        <div id="btns">
            <input
                    type="radio"
                    class="btn-check"
                    name="options-outlined"
                    id="success-outlined"
                    autocomplete="off"
                    checked=""
            />
            <label class="btn btn-outline-success" for="success-outlined">
                예약중
            </label>

            <input
                    type="radio"
                    class="btn-check"
                    name="options-outlined"
                    id="danger-outlined"
                    autocomplete="off"
            />
            <label class="btn btn-outline-danger" for="danger-outlined">
                수강완료
            </label>
        </div>
        <div id="bookingList">
            <c:if test="${empty myBookingList}">
                <div>데이터가 없음</div>
            </c:if>
            <c: forEach items="${myBookingList}" var="board">
                <a href="">
                    <div>${board.board_seq}</div>
                </a>
            </c:>
        </div>
    </div>
</div>
</body>
</html>
