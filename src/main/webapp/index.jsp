<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <jsp:include page="/WEB-INF/jsp/inc/header_link.jsp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/index.css"/>

</head>
<body>
<main>
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    <div class="main-container">
      <p class="search-count-academy">총 <strong>${count}</strong> 개의 학원</p>
        <div class = "main-contents">
          <c:forEach items="${list}" var="board">
            <a href = "/board?seq=${board.board_seq}">
              <div class="main-card">
                <h4 itemprop="academy_name" class="academy-item-name">${board.academy_name}</h4>
                <ul class="main-ul">
                  <li itemprop="content" class="academy-item-content">${board.content}</li>
                  <li itemprop="addr" class="academy-item-address">${board.addr}</li>
                  <li itemprop="ldate" class="academy-item-ldate">강의일 : ${board.ldate}</li>
                  <li itemprop="book_limit" class="academy-item-limit">예약 가능 인원 : ${board.book_limit}명</li>
                </ul>
                <div class = "academy-item-menus">
                  <div class = "academy-rate">
                    <img src = "/resources/imgs/star.png" class = "academy-rate-img"/>
                    <span itemprop="rate">${board.rate} 점</span>
                  </div>
                  <div class = "academy-review">
                    <img src = "/resources/imgs/review.png" class = "academy-count-img"/>
                    <span itemprop="review_count">${board.review_count} 개</span>
                  </div>
                </div>
              </div>
            </a>
        </c:forEach>
        </div>
    </div>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</main>
</body>
<script>

</script>
</html>
