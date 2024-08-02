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
  <c:choose>
    <c:when test="${empty member}">
      <script>
        alert("로그인이 필요합니다.")
        history.go(-1)
      </script>
    </c:when>
    <c:otherwise>
      <header>
        <div class="header-logo">
          <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt="로고">
          <a href="/member/member.do?method=myPage">${member.nickname}</a>
        </div>
      </header>
    </c:otherwise>
  </c:choose>
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
        <div><input id="title" type="text" name="title" placeholder="제목을 입력해주세요" value="${dto.title}"></div>
        <div class="rate">
          <span class="star">
          <c:forEach begin="0" end="${dto.rate-1}">
            <img src="/resources/imgs/별.png" alt="별">
          </c:forEach>
          </span>
          <select name="rate" id="rate">
            <option value="1" ${dto.rate == 1 ? 'selected' : ''}>1</option>
            <option value="2" ${dto.rate == 2 ? 'selected' : ''}>2</option>
            <option value="3" ${dto.rate == 3 ? 'selected' : ''}>3</option>
            <option value="4" ${dto.rate == 4 ? 'selected' : ''}>4</option>
            <option value="5" ${dto.rate == 5 ? 'selected' : ''}>5</option>
          </select>
        </div>
      </div>
      <div class="input-container">
        <div>
          <label for="pros"><strong>좋은점</strong></label>
          <div contenteditable="true" id="pros" name="pros"/>
          <div>${dto.pros}</div>
        </div>
        <div>
          <label for="cons"><strong>아쉬운점</strong></label>
          <div contenteditable="true" id="cons" name="cons"/>
          <div>${dto.cons}</div>

        </div>
        <div>
          <label for="features"><strong>수업방식 및 특징</strong></label>
          <div contenteditable="true" id="features" name="feature"/>
          <div>${dto.features}</div>

        </div>
        <div>
          <label for="wishes"><strong>학원에 바라는점</strong></label>
          <div contenteditable="true" id="wishes" name="wishes"/>
          <div>${dto.wishes}</div>
        </div>

      </div>

    </div>
    <div class="form-container--bottom">
      <div>
        <button id="submitBtn" class="btn btn-primary">수정</button>
        <button id="deleteBtn" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </section>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</main>
</body>
</html>


