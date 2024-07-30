<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/member/member.do?method=myId" method="post">
    <fieldset><input type="text" id="email" title="이메일" name="email" placeholder="이메일"></fieldset>
    <fieldset><input type="text" id="name" title="이름" name="name" placeholder="이름"></fieldset>
    <fieldset><button type="submit" id="find-pwd">비밀번호 찾기</button></fieldset>
</form>
</body>
</html>