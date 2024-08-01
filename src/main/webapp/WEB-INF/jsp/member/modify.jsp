<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css"/>
</head>
<body>
<h1>비밀번호 확인 완료</h1>
<form id="modifyForm" action="member.do?method=modify" method="post">
  <div class="form-floating">
    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임"/>
    <label for="nickname">닉네임</label>
  </div>
  <div class="msg miss-nickname text-danger hide">닉네임은 10글자 이하로 입력해주세요</div>
  <div class="msg input-nickname text-danger hide">닉네임을 입력해주세요</div>
  <br/>

  <div class="form-floating password">
    <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호를 입력해주세요"/>
    <div class="eyes"><i class="fa-regular fa-eye"></i></div>
    <label for="password">비밀번호</label>
  </div>
  <div class="msg fail-password-msg text-danger hide">
    8글자 이상, 영문 대소문자 숫자, 특수문자(@$!%*#?&)를 포함해주세요
  </div>
  <div class="msg input-password text-danger hide">비밀번호를 입력해주세요</div>
  <div class="form-floating">
    <input type="password" class="form-control need-top" id="password-retype" name="password-retype" placeholder="비밀번호 확인"/>
    <label for="password-retype">비밀번호 확인</label>
  </div>
  <div class="msg miss-pwd text-danger hide">비밀번호가 일치하지 않습니다</div>
  <div class="msg input-password-retype text-danger hide">
    비밀번호 확인을 입력해주세요
  </div>
  <fieldset class="join">
    <button type="button" class="btn btn-dark" id="modifyBtn">비밀번호 변경</button>
    <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
  </fieldset>
</form>
<script src="${pageContext.request.contextPath}/resources/js/member/modify.js"></script>
</body>
</html>
