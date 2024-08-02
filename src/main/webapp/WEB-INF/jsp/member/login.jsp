<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LOGIN</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css"/>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Serif+KR&display=swap" rel="stylesheet">


</head>
<body>
<main class="form-signin">
  <form name="login-form" id="loginForm" action="/member/member.do?method=match" method="post">
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/imgs/logo.png"
         alt=""/>
    <h1 class="h3 mb-3 fw-normal">가산땃쥐에 어서오세요</h1>
    <div class="form-floating input-group mb-3">
      <input type="email" id="login-email" name="login-email" class="form-control"
             aria-label="Text input with dropdown button" placeholder="name@example.com">
      <label for="login-email">이메일</label>
      <select title="email" id="email-select">
        <option class="option" value="none">직접입력</option>
        <option class="option" value="naver.com">naver.com</option>
        <option class="option" value="gmail.com">gmail.com</option>
      </select>
    </div>
    <div class="login-email-msg text-danger hide">이메일이 잘못되었습니다. 이메일을 정확히 입력해 주세요.</div>
    <div class="form-floating password">
      <input type="password" class="form-control" id="login-password" name="login-password" placeholder="Password"/>
      <div class="eyes"><i class="fa-regular fa-eye"></i></div>
      <label for="login-password">비밀번호</label>
    </div>
    <div class="login-password-msg text-danger hide">비밀번호가 잘못되었습니다. 비밀번호를 정확히 입력해 주세요.</div>
    <button id="login-btn" class="login btn btn-dark w-100 py-2" type="button">
      가산땃쥐 마을 입장
    </button>
    <button id="cancel" class="login btn btn-outline-dark w-100 py-2" type="button">돌아가기
    </button>
    <div class="sub-item">
      <div>
        <a href="/member/member.do?method=findId">아이디찾기</a>
        <span>/</span>
        <a href="/member/member.do?method=findPwd">비밀번호찾기</a></div>
      <div>
        <a href='/member/member.do?method=joinForm'>회원가입</a>
      </div>
    </div>

    <footer>
      <p>팀땃쥐. All rights reserved.</p>
    </footer>
  </form>
</main>
<script src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>
</body>
</html>

