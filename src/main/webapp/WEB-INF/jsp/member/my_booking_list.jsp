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
    $(function () {
      $("#success-outlined").on("click", function () {
        $.ajax({
          url: "member.do?m=myBookingList",
          type: GET,
          data: {so: $("#success-outlined").val()},
          datatype: 'json',
          success: function (data) {
            let html = "";
            html += "";
            if (data.length() == 0) {
              html += "<div>데이터가 없음</div>";
            } else {
              for (const board of data) {
                html += "<a href = " + "링크" + "/>";
                html += "<div>" + board.board_seq + "</div>";
                html += "<div>" + board.academy_name + "</div>";
                html += "<div>" + board.addr + "</div>";
                html += "<div>" + board.phone_num + "</div>";
                html += "<div>" + board.content + "</div>";
              }
            }
          },
          error: function (data) {

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
      /** {*/
      /*    text-decoration: none;*/
      /*    text-align: center;*/
      /*}*/

      /*#container {*/
      /*    display: flex;*/
      /*    justify-content: center;*/
      /*    width: 100vw;*/
      /*    height: 100vw;*/
      /*}*/

      /*#layout {*/
      /*    display: flex;*/
      /*    flex-direction: column;*/
      /*    align-items: center;*/
      /*    background-color: bisque;*/
      /*    width: 500px;*/
      /*    height: auto;*/
      /*    margin-top: 50px;*/
      /*}*/

      /*#btns {*/
      /*    margin-top: 50px;*/
      /*}*/

      /*#bookingList {*/
      /*    background-color: salmon;*/
      /*    margin-top: 50px;*/

      /*    width: 400px;*/

      /*}*/

      /*.data {*/
      /*    background-color: peru;*/
      /*    margin-bottom: 50px;*/
      /*    width: 400px;*/
      /*    height: 150px;*/
      /*    text-align: center;*/
      /*    justify-content: center;*/

      /*}*/

      /*a {*/
      /*    text-decoration: none;*/
      /*}*/
      .main-container {
          background-color: lightblue;
          padding-top: 300px;
      }

      main > div {
          margin-top: 150px;
      }

      * {
          box-sizing: border-box;
      }

      div {
          display: block;
          unicode-bidi: isolate;
      }

      body {
          font-size: 1rem;
          font-weight: 400;
          line-height: 1.5;
          color: #212529;
          background-color: #fff;
          -webkit-text-size-adjust: 100%;
          -webkit-tap-highlight-color: transparent;
      }

      .search-count-academy {
          font-weight: bolder;
      }

      a {
          text-decoration: none;
          color: black;
      }

      .main-card {
          background-color: white;
      }

      .main-ul {
          list-style-type: none;
          background-color: antiquewhite;
          display: flex;
          flex-direction: column;
      }

      ul {
          padding-left: 2rem;
      }

      .academy-item-content {
          font-size: 20px;
          font-weight: bold;
          padding-bottom: 1px;
      }

      i {
          display: list-item;
          text-align: -webkit-match-parent;
          unicode-bidi: isolate;
      }

      .main-ul {
          list-style-type: none;
          background-color: antiquewhite;
          display: flex;
          flex-direction: column;
      }


  </style>
  <script>
    $(function () {
      $("#success-outlined").on("click", function () {
        $.ajax({
          url: "member.do?method=reserved1",
          type: "GET",
          success: function (data) {

          },
          error: function (data) {
            alert("예약된 강의가 없습니다");
          }
        })
      })
      $("#danger-outlined").on("click", function () {
        $.ajax({
          url: "member.do?method=reserved2",
          type: "GET",
          success: function (data) {

          },
          error: function (data) {
            alert("예약된 강의가 없습니다");
          }
        })
      })
    })
  </script>
</head>
<body>
<div id="container">
  <div id="main-container">
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

    <div class="main-container">
      <p class="count-book">총 <strong>n</strong>개의 예약</p>
      <div class="main-contents"></div>
      <c:if test="${empty myBookingList}">
        <div class="main-card">예약한 강의가 없습니다</div>
      </c:if>
      <c:forEach items="${myBookingList}" var="board">
        <a href="">
          <div class="main-card">
            <h4>${board.academy_name}</h4>
            <ul class="main-ul">
              <li itemprop="content" class="academy-item-content">${board.content}</li>
              <li itemprop="addr" class="academy-item-address">${board.addr}</li>
              <li itemprop="ldate" class="academy-item-ldate">강의일 : ${board.lDate}</li>
              <li itemprop="book_limit" class="academy-item-limit">예약가능 인원 : ${board.book_limit}</li>
            </ul>
            <div class="academy_item-menus">
              <div class="academy-rate">
                <img src="/resources/imgs/star.png" class="academy-rate-img"/>
                <span itemprop="rate">0점/span>
              </div>
              <div class="academy-review">
                <img src="/resources/imgs/review.png" class="academy-count-img"/>
                <span itemprop="review_count">0 개</span>
              </div>
            </div>
          </div>
        </a>
      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>