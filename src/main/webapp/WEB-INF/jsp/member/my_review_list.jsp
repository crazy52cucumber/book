<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <style>
      * {
          box-sizing: border-box;
      }

      main {
          max-width: 500px;
          width: 100%;
      }

      main > div {
          margin-top: 150px;
      }

      section {
          border: 1px solid violet;
          height: 175px;
      }

      a {
          cursor: pointer;
      }

      @media screen and (min-width: 501px) {
          main {
              margin: 0 auto;
          }
      }

      @media screen and (max-width: 500px) {
          main {
              margin: 0;
          }
      }

      /*긁어옴*/
      img {
          height: 24px;
          overflow-clip-margin: content-box;
          overflow: clip;
          vertical-align: middle;
      }

      img, svg {
          vertical-align: middle;
      }

      img {
          overflow-clip-margin: content-box;
          overflow: clip;
      }

      a {
          color: #0d6efd;
          text-decoration: underline;
      }

      a:-webkit-any-link {
          color: -webkit-link;
          cursor: pointer;
      }

      li {
          text-align: -webkit-match-parent;
      }

      ul {
          list-style-type: disc;
      }

      body {
          margin: 0;
          /*font-family: var(--bs-font-sans-serif);*/
          font-size: 1rem;
          font-weight: 400;
          line-height: 1.5;
          color: #212529;
          background-color: #fff;
          -webkit-text-size-adjust: 100%;
          -webkit-tap-highlight-color: transparent;
      }


  </style>
</head>
<body>
<main>
  <div class="my-review-container">
    <c:if test="${empty myReviewList}">
      <div>작성한 리뷰가 없음</div>
    </c:if>
    <c:forEach items="${myReviewList}" var="review">
      <a href = "#">
       <div class="my-review-card">
         <!--  <div class="my-review-card--header">
            <img src="/>resources/imgs/별.png" alt>
            <span>${review.rate}</span>

          </div>-->
          <p class="my-review-card--content">
            <span class="title">${review.title}</span>
          </p>
          <ul class="review-card--info">
            <li>
              <span>${member.nickname}</span>
            </li>
            <li>
              <span>중등</span>
            </li>
            <li>
              <span>${review.cdate}</span>
            </li>
          </ul>
        </div>
      </a>
    </c:forEach>


  </div>
</main>


</body>
</html>