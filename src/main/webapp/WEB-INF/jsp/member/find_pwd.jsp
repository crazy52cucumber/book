<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css"/>
</head>
<body>
<div class="container">
    <form action="/member/member.do?method=myPwd" method="post">
        <div class="form-floating input-group mb-3">
            <input type="email" id="email" name="email" class="form-control" aria-label="Text input with dropdown button" placeholder="name@example.com" >
            <label for="email">이메일</label>
            <select title="email" id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver.com">naver.com</option>
                <option class="option" value="gmail.com">gmail.com</option>
            </select>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="name" name="name" placeholder="이름"/>
            <label for="name">이름</label>
        </div>
        <div class="msg duplicated-email text-danger hide">
            가입된 정보가 없습니다. 다시 입력해주세요
        </div>
        <fieldset>
            <button type="button" class="btn btn-dark" id="find-pwd">비밀번호 찾기</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/member/find_pwd.js"></script>
</body>
</html>