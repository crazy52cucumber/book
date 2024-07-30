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
        display: flex;
        justify-content: center;
        margin: 10px;
        padding: 10px 12px;
      }
      button{
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
        <c:choose>
            <c:when test="${empty email}">
                해당하는 이메일이 없습니다
                <fieldset>
                    <button type="button" class="btn btn-dark" id="find-id" onclick='findId()'>아이디 찾기</button>
                    <button type="button" class="btn btn-outline-dark" id="cancel" onclick='close()'>취소</button>
                </fieldset>
            </c:when>
            <c:otherwise>
                이메일은 ${email}
                <fieldset>
                    <button type="button" class="btn btn-dark" id="find-password" >비밀번호 찾기</button>
                    <button type="button" class="btn btn-outline-dark" id="confirm" onclick='close()'>확인</button>
                </fieldset>
            </c:otherwise>
        </c:choose>


</div>

<script>
  function findId(){
    location.href='/member/member.do?method=findId';
  }
  function close(){
    location.href='/';
  }
  function findPwd(){
    alert('안돼')
  }
</script>
</body>
</html>
