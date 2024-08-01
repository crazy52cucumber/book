<%@ page import="static member.util.SignupConst.FAILURE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
  if (${result}==<%=FAILURE%>) {
    alert('비밀번호 변경에 실패하였습니다. 다시 시도해주세요');
    location.href='/member/member.do?method=findPwd';
  } else {
    alert('비밀번호가 변경되었습니다 :)');
    location.href='/member/member.do?method=login'
  }
</script>