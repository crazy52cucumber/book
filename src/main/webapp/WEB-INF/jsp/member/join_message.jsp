<%@ page import="static member.util.SignupConst.FAILURE" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-26
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
  if (${result}==<%=FAILURE%>) {
    alert("동일한 아이디가 있습니다")
    history.back();
  } else {
    location.href='/member/member.do'
  }
</script>
