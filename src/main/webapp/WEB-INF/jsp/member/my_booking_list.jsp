<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-26
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(function(){
            $("#success-outlined").on("click", function (){
                $.ajax({
                    url: "",
                    type: GET,
                    data: {so : $("#success-outlined").val()},
                    datatype: 'json',
                    success: function(data){
                        let html = "";
                        html += "";
                        if(data.length() ==0){
                            html += "<div>데이터가 없음</div>";
                        }else{
                            for(const board of data){
                                html += "<a href = "+"링크"+"/>";
                                html += "<div>"+board.board_seq+"</div>";
                                html += "<div>"+board.academy_name+"</div>";
                                html += "<div>"+board.addr+"</div>";
                                html += "<div>"+board.phone_num+"</div>";
                                html += "<div>"+board.content+"</div>";
                            }
                        }
                    },
                    error: function (data){

                    }
                });
            });
        });
    </script>

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
        #bookingList {
            background-color: salmon;
            margin-top: 50px;

            width: 400px;

        }

        .data {
            background-color: peru;
            margin-bottom: 50px;
            width: 400px;
            height: 150px;
            text-align: center;
            justify-content: center;

        }

        a {
            text-decoration: none;
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
                <div class="data">예약한 강의가 없습니다</div>
            </c:if>
            <c:forEach items="${myBookingList}" var="board">
                <a href="">
                    <div class="data">${board.board_seq}</div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>