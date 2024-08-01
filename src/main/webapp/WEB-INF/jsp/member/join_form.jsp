<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Email Validation</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css"/>
</head>
<body>
<main>
    <form name="join-form" action="/member/member.do?method=join" method="post">
        <div class="form-floating input-group mb-3">
            <input type="email" id="email" name="email" class="form-control"
                   aria-label="Text input with dropdown button" placeholder="name@example.com"
                   autofocus>
            <input type="hidden" id="emailHidden" name="emailHidden">
            <label for="email">이메일</label>
            <select title="email" id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver.com">naver.com</option>
                <option class="option" value="gmail.com">gmail.com</option>
            </select>
            <button class="btn btn-outline-secondary" type="button" id="authSendBtn">인증번호 받기</button>
        </div>
        <div class="msg miss-email text-danger hide">올바른 이메일 형식을 입력해주세요</div>
        <div class="msg input-email text-danger hide">이메일을 입력해주세요</div>
        <div class="msg duplicated-email text-danger hide">동일한 이메일이 있습니다. 다른 이메일을 입력해주세요</div>
        <div class="form-floating input-group mb-3">
            <input type="text" class="form-control" id="authenticCode" name="authenticCode"
                   placeholder="인증번호"/>
            <label for="authenticCode">인증번호</label>
            <button class="btn btn-outline-secondary" type="button" id="authConfirmBtn">인증번호 확인
            </button>
        </div>
        <div class="msg input-authCode text-success hide">인증이 완료되었습니다</div>
        <div class="msg fail-authCode text-danger hide">인증 코드가 맞지않습니다. 다시 입력해주세요</div>
        <div class="msg fail-authCode2 text-danger hide">이메일 인증을 먼저 해주세요</div>
        <div class="form-floating password">
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="비밀번호"/>
            <div class="eyes"><i class="fa-regular fa-eye"></i></div>
            <label for="password">비밀번호</label>
        </div>
        <div class="msg fail-password-msg text-danger hide">
            8글자 이상, 영문 대소문자 숫자, 특수문자(@$!%*#?&)를 포함해주세요
        </div>
        <div class="msg input-password text-danger hide">비밀번호를 입력해주세요</div>
        <div class="form-floating">
            <input type="password" class="form-control need-top" id="password-retype"
                   name="password-retype" placeholder="비밀번호 확인"/>
            <label for="password-retype">비밀번호 확인</label>
        </div>
        <div class="msg miss-pwd text-danger hide">비밀번호가 일치하지 않습니다</div>
        <div class="msg input-password-retype text-danger hide">
            비밀번호 확인을 입력해주세요
        </div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="name" name="name"
                   placeholder="이름"/>
            <label for="name">이름</label>
        </div>
        <div class="msg input-name text-danger hide">이름을 입력해주세요</div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="phone" name="phone"
                   placeholder="전화번호"/>
            <label for="phone">전화번호</label>
        </div>
        <div class="msg input-phone text-danger hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
        <div class="msg duplicated-phone text-danger hide">동일한 번호로 가입한 계정이 존재합니다</div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="nickname" name="nickname"
                   placeholder="닉네임"/>
            <label for="nickname">닉네임</label>
        </div>
        <div class="msg miss-nickname text-danger hide">닉네임은 10글자 이하로 입력해주세요</div>
        <div class="msg input-nickname text-danger hide">닉네임을 입력해주세요</div>
        <fieldset class="join">
            <button type="button" class="btn btn-dark" id="join">회원가입</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</main>
<script src="${pageContext.request.contextPath}/resources/js/member/join.js"></script>
</body>
</html>