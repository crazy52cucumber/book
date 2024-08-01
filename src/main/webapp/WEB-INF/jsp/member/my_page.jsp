<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
      * {
          text-decoration: none;
          text-align: center;
          justify-content: center;
      }

      #container {
          display: flex;
          width: 100%;
          height: 100%;
      }

      #layout {
          display: flex;
          flex-direction: column;
          align-items: center;
          background-color: bisque;
          width: 500px;
          height: 650px;
          margin-top: 50px;
      }

      .content {
          display: flex;
          align-items: center;
          background-color: skyblue;
          width: 400px;
          height: 150px;
          border-radius: 10px;
      }

      #userInfo {
          background-color: seagreen;
          margin-top: 50px;
          margin-bottom: 50px;
      }


      #infoWindow {
          width: 300px;
          display: flex;
          flex-direction: column;
      }

      #infoWindow > div {
          display: flex;
          height: 75px;
          align-items: center;
          justify-content: left;
          margin-left: 50px;
          font-size: larger;
      }

      #ebtn {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 150px;
          width: 100px;
      }

      #btn {
          border-radius: 30px;
          width: 50px;
          height: 50px;
      }

      a {
          margin-bottom: 50px;
      }


  </style>


</head>
<body>
<div id="container">
  <div id="layout">
    <div id="userInfo" class="content">
      <div id="infoWindow">
        <div>${member.nickname}</div>
        <div>${member.email}</div>
      </div>
      <div id="ebtn">
        <input id="btn" type="button" value="편집"/>
      </div>
    </div>

    <script>
      $(function () {
        $("#btn").click(function () {
          window.location.href = 'member.do?method=startModify';
        });
      });
    </script>


    <a href="member.do?method=myBookingList">
      <div class="content">
        <p>나의 예약현황</p>
      </div>
    </a>
    <a href="member.do?method=myReviewList">
      <div class="content">
        <p>나의 리뷰</p>
      </div>
    </a>
  </div>
</div>
<a href="/member/member.do?method=logout">로그아웃</a>

</body>
</html>