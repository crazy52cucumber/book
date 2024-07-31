<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        background-image: url('https://i.ytimg.com/vi/MzwaGilR9Oo/maxresdefault.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        width: 100vw;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .container {
        background: #ffffff;
        border: 1px solid black;
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      fieldset{
        margin: 10px;
        padding: 10px 12px;
      }
      button{
        margin-top: 20px;
        margin-right: 5px;
      }
      .hide{
        display: none;
      }
    </style>
</head>
<body>
<div class="container" style="width: 600px">
    <h1>아이디 찾기</h1>
    <fieldset>
        <c:choose>
            <c:when test="${empty email}">
                <div>
                해당하는 이메일이 없습니다
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
</div>

<script>
  function findId(){location.href='/member/member.do?method=findId';}
  function findPwd(){location.href='/member/member.do?method=findPwd';}
  function close(){location.href='/member/member.do?method=login';}
  document.getElementById('cancel').addEventListener('click', () => location.href = '/member/member.do?method=login')
</script>
</body>
</html>
