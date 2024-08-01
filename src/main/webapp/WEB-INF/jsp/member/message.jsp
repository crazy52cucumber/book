<%@ page import="static member.util.SignupConst.NOID" %>
<%@ page import="static member.util.SignupConst.NOPASSWORD" %>
<%@ page import="static member.util.SignupConst.ERROR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script>
  const result = ${result}
  if (result == <%=NOID%>) {
    alert("그런 이메일을 가진 땃쥐는 없어요");
  } else if (result == <%=NOPASSWORD%>) {
    alert("비밀번호가 맞지 않아요");
  } else if (result==<%=ERROR%>) {
    alert("DB오류")
  } else {
    alert('${member.nickname} 땃쥐님이시군요. 어서오세요 :)');
    location.href = "/";
  }
</script>
