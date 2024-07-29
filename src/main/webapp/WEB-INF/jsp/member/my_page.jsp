<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <style>
      * {
          text-decoration: none;
          text-align: center;
          justify-content: center;

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
          height: 650px;
          margin-top: 50px;
      }

      #userInfo {
          background-color: salmon;
          display: flex;
          margin-top: 50px;
          margin-bottom: 50px;
          width: 400px;
          height: 150px;
          border: 1px solid black;
          border-radius: 10px;
      }

      #infoWindow {
          background-color: seagreen;
          width: 300px;
          display: flex;
          flex-direction: column;


      }

      #infoWindow > div {
          display: flex;
          height: 150px;
          align-items: center;
          border: 1px solid black;
      }

      #ebtn {
          display: flex;
          align-items: center;
          justify-content: center;
          background-color: teal;
          height: 150px;
          width: 100px;
      }

      #btn {
          border-radius: 30px;
          background-color: #007aff;
          width: 50px;
          height: 50px;
      }

      #book {
          background-color: skyblue;
          width: 400px;
          height: 150px;
      }

      a {
          margin-bottom: 50px;
      }
      
      #reply {
          background-color: skyblue;
          width: 400px;
          height: 150px;
          margin-bottom: 50px;
      }


  </style>
</head>
<body>
<div id="container">
  <div id="layout">
    <div id="userInfo">
      <div id="infoWindow">
        <div>${member.nickname}</div>
        <div>${member.email}</div>
      </div>
      <div id="ebtn">
        <input id="btn" type="button" value="편집">
      </div>

    </div>
    <a href="member.do?method=myBookingList">
      <div id="book">
        나의 예약현황
      </div>
    </a>
    <a href="">
      <div id="reply">
        나의 리뷰
      </div>
    </a>
  </div>
</div>

</body>
</html>