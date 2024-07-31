<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-31
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>
      div {
          display: flex;
          flex-direction: column;
          justify-content: center;
      }
  </style>


</head>
<body>
<form action="member.do?method=modifyCheck" method="post">

  <input type="text" id="inputPwd" oninput="pwCheck()" placeholder="비밀번호 확인"><br>
  <span id="pwConfirm">비밀번호를 입력하세요</span>
  </div>
</form>
<%--<% String errorMessage = (String) request.getAttribute("errorMessage"); %>--%>
<%--<% if (errorMessage != null) { %>--%>
<%--<div class="error-message"><%= errorMessage %>--%>
<%--</div>--%>
<%--<% } %>--%>
</body>
</html>