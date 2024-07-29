<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      :root {
        --swiper-theme-color: #007aff;
      }

      :root {
        --max-width: 600px;
      }

      html,
      body {
        min-height: 100%;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }

      :root {
        view-transition-name: root;
      }

      html {
        display: block;
      }

      nav {
        border: 1px solid #000;
        box-sizing: border-box;
      }

      @media (min-width: 600px) {
        body {
          margin: 0 auto !important;
        }
      }

      .search-input {
        border-radius: 30px;
        border: 1px solid #1263be;
        background: #ffffff;
      }

      .login-header {
        border: 1px solid red;
      }

      .container {
        border: 1px solid #007aff;
        height: 100vh;
        display: flex;
        flex-direction: column;
      }

      .header {
        border: 1px solid red;
      }

      .header-text {
      }

      .main {
        border: 1px solid green;
        background: #b2b3ec;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      fieldset {
        display: flex;
        justify-content: center;
        margin: 10px;
        padding: 10px 12px;
      }

      input {
        width: 15rem;
        height: 2rem;
        border: none;
        border-radius: 20px;
      }

      input:focus {
        outline: none;
      }

      .login {
        cursor: pointer;
        width: 16.3rem;
        height: 3rem;
        border: none;
        border-radius: 20px;
      }

      .logo {
      }

      .hide {
        display: none;
      }
    </style>
</head>
<body>
<div class="container" style="width: 600px">
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">땃쥐맘</a>
        </div>
    </nav>
    <header class="header">
        <h2 class="header-text">강남땃쥐맘 로그인 및 가입</h2>
    </header>
    <main class="main">
        <form name="login-form" action="/member/member.do?method=match" method="post">
            <fieldset>
                <input type="text" id="login-email" name="login-email" placeholder="이메일"/>
            </fieldset>
            <fieldset>
                <input
                        type="password"
                        id="login-password"
                        name="login-password"
                        placeholder="비밀번호"
                />
            </fieldset>
            <fieldset class="hide" style="width: 500px; color: #ca3030">
                <div class="str-pwd-msg hide">
                    아이디(로그인 전화번호, 로그인 전용 아이디) 또는 비밀번호가 잘못
                    되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.
                </div>
            </fieldset>
            <fieldset>
                <button class="login" type="submit">로그인</button>
            </fieldset>
        </form>

        <nav class="">
            <fieldset>
                <a href="#">비밀번호찾기</a>
            </fieldset>
            <fieldset>
                <a href="<c:url value='/member/member.do?method=joinForm'/>">회원가입</a>
            </fieldset>
        </nav>
    </main>
    <footer>
        <p>팀땃쥐. All rights reserved.</p>
    </footer>
</div>
</body>
</html>

