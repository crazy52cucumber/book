<%--
  Created by IntelliJ IDEA.
  User: tane9
  Date: 2024-07-30
  Time: 오후 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
    <form action="member.do?method=modifyCheck" method="post">
        <div>
            <input type="password"/>
        </div>
        <div>
            <input type="submit" value="확인" />
        </div>
    </form>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <div class="error-message"><%= errorMessage %></div>
    <% } %>
</body>
</html>
