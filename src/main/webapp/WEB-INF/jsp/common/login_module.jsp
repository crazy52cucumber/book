<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<meta charset="UTF-8">
<c:if test="${empty member}">
    <script>
    alert('강남땃지와 함께 하시면 이용할 수 있는 서비스입니다 :)')
    location.href='/member/member.do?method=login'
    </script>
</c:if>