<%--
  Created by IntelliJ IDEA.
  User: heosangbeom
  Date: 2024. 7. 28.
  Time: 오후 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        *{
          box-sizing: border-box;
          margin: 0;
          padding: 0;
        }
        body{
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }
    </style>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="">
    <ul>
        <li><input type="text" placeholder="이름" title="이름입력" id="name" name="name"></li>
        <li><input type="text" placeholder="전화번호" title="전화번호" id="phone" name="phone"></li>
        <li><button>아이디찾기</button></li>
    </ul>
</form>
<script>
    $('input[type="text"]').keydown((event)=>{
      if(event.keyCode ===13){
        event.preventDefault();
      }
    });
</script>
</body>
</html>
