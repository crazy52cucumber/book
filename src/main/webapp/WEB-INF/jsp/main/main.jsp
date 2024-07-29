<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>메인</title>
</head>
<body>
<c:if test="${empty member}">
  <h1>로그인 안돼있음</h1>
  로그인하러 가셈
</c:if>
<h1>이용가능</h1>
</body>
</html>
