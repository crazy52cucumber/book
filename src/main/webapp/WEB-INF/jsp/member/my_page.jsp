<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/jsp/common/login_module.jsp"/>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
      * {
          text-align: center;
          justify-content: center;
      }

      #container {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin: 50px auto;
          max-width: 500px;
          width: 100%;
      }

      .content {
          display: flex;
          align-items: center;
          background-color: skyblue;
          width: 500px;
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
          font-weight: bold;
          color: white;
      }

      #ebtn {
          display: flex;
          align-items: center;
          justify-content: right;
          height: 150px;
          width: 100px;
      }

      #btn {
          border: seagreen;
          border-radius: 30px;
          width: 50px;
          height: 50px;
          font-weight: bold;
      }

      a {
          text-decoration: none;
          color: white;
          font-size: 20px;
          font-weight: bold;
      }

      .a {
          margin-bottom: 50px;
      }

      #home {
          display: flex;
          align-items: center;
          margin-left: 30px;
          background-color: darkseagreen;
          border-radius: 25px;
          width: 100px;
          height: 50px;
      }

      #logout {
          display: flex;
          align-items: center;
          margin-right: 30px;
          background-color: darkseagreen;
          border-radius: 25px;
          width: 100px;
          height: 50px;
      }

      .header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 10px;
          background-color: darkslategray;
          width: 500px;
          height: 100px;
      }
  </style>


</head>
<body>
<div id="container">
  <div class="header">
    <a id="home" href="/">가산땃쥐</a>
    <a id="logout" href="/member/member.do?method=logout">
      로그아웃
    </a>

  </div>
  <div id="userInfo" class="content">
    <div id="infoWindow">
      <div>${member.nickname}</div>
      <div>${member.email}</div>
    </div>
    <div id="ebtn">
      <input id="btn" type="button" value="편집"/>
    </div>
  </div>
  <a class="a" href="member.do?method=myBookingList">
    <div class="content">
      <p>나의 예약현황</p>
    </div>
  </a>
  <a class="a" href="member.do?method=myReviewList">
    <div class="content">
      <p>나의 리뷰</p>
    </div>
  </a>

</div>

<script>
  $(function () {
    $("#btn").click(function () {
      window.location.href = 'member.do?method=startModify';
    });
  });
</script>
</body>
</html>