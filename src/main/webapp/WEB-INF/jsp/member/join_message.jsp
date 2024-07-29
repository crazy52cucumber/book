<%@ page import="static member.util.SignupConst.FAILURE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
  if (${result}==<%=FAILURE%>) {
    alert("동일한 아이디가 있습니다")
  } else {
    alert("가입 성공했습니다 저희 사이트를 이용하실 수 있습니다")
    location.href = "/";
  }
</script>
