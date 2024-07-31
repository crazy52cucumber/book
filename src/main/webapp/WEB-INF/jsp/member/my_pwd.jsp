<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

      fieldset {
        display: flex;
        justify-content: center;
        margin: 10px;
        padding: 10px 12px;
      }

      button {
        margin-right: 5px;
      }

      .hide {
        display: none;
      }
    </style>
</head>
<body>
<div class="container">
    <form action="/member/member.do?method=myPwd" method="post">
        <fieldset><input type="text" id="email" title="이메일" name="email" placeholder="인증번호">
        </fieldset>
        <fieldset><input type="text" id="name" title="이름" name="name" placeholder="변경할 비밀번호">
        </fieldset>
        <fieldset>
            <button type="button" id="find-pwd">비밀번호 변경하기</button>
        </fieldset>
    </form>
</div>

</body>
</html>
