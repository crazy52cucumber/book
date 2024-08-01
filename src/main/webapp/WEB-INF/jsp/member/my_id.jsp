<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <style>
      html, body {
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
      }
      main{
        width: 500px;
        height: 100vh;
        border: 1px solid #000;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      fieldset{
        display: flex;
        flex-direction: column;
        justify-content: center;
      }
      button{
        margin-top: 10px;
      }
    </style>
</head>
<body>
<main>
    <h1>아이디 찾기</h1>
    <fieldset>
        <c:choose>
            <c:when test="${empty email}">
                <div>
                    해당하는 이메일이 없습니다 땃쥐 맞습니까 닝겐..? :o
                </div>
                <button type="button" name="findId" class="btn btn-dark" id="find-id" onclick='findId()'>아이디 찾기</button>
            </c:when>
            <c:otherwise>
                <div>
                    이메일은 ${email}
                </div>
                <button type="button" name="findPwd" class="btn btn-dark" id="find-pwd" onclick='findPwd()'>비밀번호 찾기</button>
            </c:otherwise>
        </c:choose>
        <button type="button" name="close" class="btn btn-outline-dark" id="cancel">로그인</button>
    </fieldset>
</main>

<script>
  function findId(){location.href='/member/member.do?method=findId';}
  function findPwd(){location.href='/member/member.do?method=findPwd';}
  function close(){location.href='/member/member.do?method=login';}
  document.getElementById('cancel').addEventListener('click', () => location.href = '/member/member.do?method=login')
</script>
</body>
</html>