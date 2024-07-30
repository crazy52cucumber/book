<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<body>
  <div class="book-wrapper">
    <div class="book-container">
      <c:choose>
        <c:when test="${book.bookCnt == book.totalBookLimit}">
          <button id="fullyBtn" class="btn btn-warning " disabled> 예약마감 </button>
        </c:when>
        <c:otherwise>
          <c:choose>
            <c:when test="${statusBook == 0}">
              <button id="bookBtn" class="btn btn-warning"> 예약하기 (${book.bookCnt}/${book.totalBookLimit})</button>
            </c:when>
            <c:otherwise>
              <button id="cancelBtn" class="btn btn-warning " disabled> 예약취소 </button>
            </c:otherwise>
          </c:choose>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>