<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css"/>
</head>
<body>
<main>
        <form action="/member/member.do?method=myId" method="post">
            <div class="form-floating">
                <input type="text" class="form-control need-top" id="name" name="name" placeholder="이름"/>
                <label for="name">이름</label>
            </div>
            <div class="msg input-name text-danger hide">이름을 입력해주세요</div>
            <div class="form-floating">
                <input type="text" class="form-control need-top" id="phone" name="phone" placeholder="전화번호"/>
                <label for="phone">전화번호</label>
            </div>
            <div class="msg input-phone text-danger hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
            <fieldset>
                <button type="button" class="btn btn-dark" id="find-id">아이디 찾기</button>
                <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
            </fieldset>
        </form>
</main>

<script src="${pageContext.request.contextPath}/resources/js/member/find_id.js"></script>
</body>
</html>