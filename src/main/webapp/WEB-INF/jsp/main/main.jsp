<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-26
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
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
<c:choose>
    <c:when test="${empty member}">
    <h1>로그인 안돼있음</h1>
    로그인하러 가셈
    <a href='/member/member.do?method=login'>로그인하기</a>
    </c:when>
    <c:otherwise>
<h1>이용가능</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
