<%@ page import="static member.util.SignupConst.FAILURE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
  if (${result}==<%=FAILURE%>) {
    alert("동일한 이메일이나 전화번호를 가진 계정이 있습니다")
    location.href='/member/member.do?method=joinForm'
  } else {
    location.href='/'
  }
</script>
