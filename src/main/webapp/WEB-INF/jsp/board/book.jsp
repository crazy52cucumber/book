<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<body>
  <div class="book-wrapper">
    <div class="book-container">
      <c:choose>
        <c:when test="${book.bookCnt == book.totalBookLimit}">
          <button id="fullyBookBtn" class="btn btn-warning " disabled> 예약마감 </button>
        </c:when>
        <c:otherwise>
          <button id="bookBtn" class="btn btn-warning"> 예약하기 (${book.bookCnt}/${book.totalBookLimit})</button>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>