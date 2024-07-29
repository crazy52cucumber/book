<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<ul>
  <%--list를 반복문 돌리기--%>
  <c:forEach var="review" items="${review.dto}">
    <li>
      <a href="javascript:void(0)" data-writer='${review.memberSeq}'>
        <div class="review-card">
          <div class="review-card--header">
            <div>
              <img src="${pageContext.request.contextPath}/resources/imgs/별.png" alt="">
              <span>${review.rate}</span>
            </div>
            <div>
              정성리뷰
            </div>
          </div>
          <p class="review-card--content">
            <span class="title">${review.content}</span>
          </p>
          <ul class="review-card--info">
            <li><span class="">${review.nickname}</span></li>
            <li><span>${review.grade}</span></li>
            <li><span>${review.cdate}</span></li>
          </ul>
        </div>
      </a>
    </li>
  </c:forEach>
</ul>