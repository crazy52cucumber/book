<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/WEB-INF/jsp/inc/header_link.jsp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/content.css"/>
  <script type="module" defer src="${pageContext.request.contextPath}/resources/js/board/content.js"></script>
  <script type="module" defer src="${pageContext.request.contextPath}/resources/js/board/review/review.js"></script>
  <script type="module" defer src="${pageContext.request.contextPath}/resources/js/board/book/book.js"></script>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Serif+KR&display=swap" rel="stylesheet">

</head>
<body>
<main>
  <header>
    <div class="header-logo">
      <div>
        <a href="/"> <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt=""></a>
        <p>강남땃쥐</p>
      </div>
      <c:choose>
        <c:when test="${empty member}">
          <a href="<c:url value='/member/member.do?method=login'/>">로그인하기</a>
        </c:when>
        <c:otherwise>
          <a href="/member/member.do?method=myPage">${member.nickname}</a>
        </c:otherwise>
      </c:choose>
    </div>
  </header>
  <section>
    <jsp:include page="/WEB-INF/jsp/board/accademy_info.jsp"/>
    <jsp:include page="/WEB-INF/jsp/board/accademy_review.jsp"/>
  </section>


  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <jsp:include page="/WEB-INF/jsp/board/book.jsp"/>
  <jsp:include page="/WEB-INF/jsp/common/bottom_menu.jsp"/>
</main>
</body>
</html>
