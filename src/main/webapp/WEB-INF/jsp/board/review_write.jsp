<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Title</title>
  <jsp:include page="/WEB-INF/jsp/inc/header_link.jsp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/review_write.css">
  <script type="module" src="${pageContext.request.contextPath}/resources/js/board/review/review.js"></script>
</head>
<body>
<main>
  <header>

    <div class="header-logo">
      <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt="">
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
  <section class="form-wrapper">

    <div class="board-container">
      <div class="img-container">
        <img class="a-image" src="${pageContext.request.contextPath}/resources/imgs/hb.jpg" alt="학원이미지">
      </div>
      <table>
        <tbody>
        <tr>
          <th>학원</th>
          <td>${board.academyName}</td>
        </tr>
        <tr>
          <th>주소</th>
          <td>${board.addr}</td>
        </tr>
        <tr>
          <th>학년</th>
          <td>${board.grade}</td>
        </tr>
        <tr>
          <th>과목</th>
          <td>${board.subject}</td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="form-container">
      <div class="form-container--top">
        <div><input id="title" type="text" name="title" placeholder="제목을 입력해주세요"></div>
        <div class="rate">
          <span class="star"><img src="/resources/imgs/별.png" alt="별"></span>
          <select name="rate" id="rate">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
        </div>
      </div>

      <div class="input-container">
        <div>
          <label for="pros"><strong>좋은점</strong></label>
          <div contenteditable="true" id="pros" name="pros"/>
        </div>
        <div>
          <label for="cons"><strong>아쉬운점</strong></label>
          <div contenteditable="true" id="cons" name="cons"/>
        </div>
        <div>
          <label for="features"><strong>수업방식 및 특징</strong></label>
          <div contenteditable="true" id="features" name="feature"/>
        </div>
        <div>
          <label for="wishes"><strong>학원에 바라는점</strong></label>
          <div contenteditable="true" id="wishes" name="wishes"/>
        </div>

      </div>
    </div>
    <div class="form-container--bottom">
      <div>
        <button id="submitBtn" class="btn btn-primary">작성</button>
        <button id="formCancle" class="btn btn-danger" onclick="history.back()">뒤로가기</button>
      </div>
    </div>
  </section>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</main>
</body>
</html>
