<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-26
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
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

      .review-form {
          background-color: seagreen;
          border-radius: 15px;
          width: 500px;
          height: 650px;
          display: flex;
          flex-direction: column;
          justify-content: center;
          padding: 8px;
      }

      a {
          text-decoration: none;
      }

      .review-header {
          background-color: darkseagreen;
          display: flex;
          flex-direction: row;
          justify-content: space-between;
          border-radius: 10px;
          width: 350px;
          margin: auto auto;
          padding: 5px;
      }

      .review-header-content {
          display: flex;
          flex-direction: row;
      }

      .text-form {
          background-color: darkseagreen;
          border-radius: 15px;
          width: 450px;
          height: 580px;
          display: flex;
          flex-direction: column;
          margin: 20px auto;
          padding: 10px;
          gap: 10px;

      }

      #review-title {
          background-color: khaki;
          border-radius: 10px;
          display: flex;
          justify-content: center;
          font-size: 20px;
          font-weight: bold;
          padding: 3px;
      }

      .content-field {
          display: flex;
          flex-direction: column;
          gap: 10px;
          margin-top: 18px;
      }

      .content {
          background-color: white;
          border-radius: 5px;
          height: 100px;
      }

      .field-name {
          width: auto;
          border-bottom: dotted #b2b3ec;
          padding: 2px;
          font-weight: bold;
      }

      .core {
          padding: 10px;
      }


  </style>
</head>
<body>
<main>
  <div class="my-review-container">
    <c:if test="${empty myReviewList}">
      <div class="review-form">작성한 리뷰가 없음</div>
    </c:if>
    <c:forEach items="${myReviewList}" var="review">

      <div class="review-form">
        <div class="review-header">
          <div class="review-header-content">
            <div>${review.grade}</div>
            &nbsp;
            <div>${review.subject}</div>
          </div>
          <div><a href='http://localhost:8080/board?seq=${review.board_seq}'>${review.content}</a></div>
        </div>
        <div class="text-form">
          <div id="review-title">${review.title}</div>
          <div class="content-field">
            <div class="content">
              <div class="field-name">장점</div>
              <div class="core">${review.pros}</div>
            </div>
            <div class="content">
              <div class="field-name">단점</div>
              <div class="core">${review.cons}</div>
            </div>
            <div class="content">
              <div class="field-name">특징</div>
              <div class="core">${review.features}</div>
            </div>
            <div class="content">
              <div class="field-name">바라는점</div>
              <div class="core">${review.wishes}</div>
            </div>
          </div>
        </div>
        <div>${review.createDate}</div>
      </div>
    </c:forEach>


  </div>
</main>


</body>
</html>