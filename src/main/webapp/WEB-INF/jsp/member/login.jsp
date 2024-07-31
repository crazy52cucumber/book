<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
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
        border: none;
        border-bottom: 1px solid black;
        width: 15rem;
        height: 2rem;
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

      .password {
        position: relative;
      }

      .password .eyes {
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        margin: auto 2px;
        height: 30px;
        font-size: 22px;
        cursor: pointer;
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
        <form name="login-form" id="loginForm" action="/member/member.do?method=match" method="post">
            <fieldset>
                <input type="text" id="login-email" name="login-email" placeholder="이메일" autofocus/>
            </fieldset>
            <div class="login-email-msg hide">이메일이 잘못되었습니다. 이메일을 정확히 입력해 주세요.</div>
            <fieldset>
                <select title="email" id="email-select">
                    <option class="option" value="none">직접입력</option>
                    <option class="option" value="naver.com">naver.com</option>
                    <option class="option" value="gmail.com">gmail.com</option>
                </select>
            </fieldset>
            <fieldset class="password">
                <input type="password" id="login-password" name="login-password" placeholder="비밀번호"/>
                <div class="eyes"><i class="fa-regular fa-eye"></i></div>
            </fieldset>
            <div class="login-password-msg hide">비밀번호가 잘못되었습니다. 비밀번호를 정확히 입력해 주세요.</div>
            <fieldset>
                <button id="login-btn" class="login" type="button">강남땃쥐 시작하기</button>
            </fieldset>
        </form>

        <div class="login-footer">
            <a href="/member/member.do?method=findId">아이디찾기</a>
            <span>/</span>
            <a href="/member/member.do?method=findPwd">비밀번호찾기</a>
        </div>
        <div>
            <a href='/member/member.do?method=joinForm'>회원가입</a>
        </div>
    </main>
    <footer>
        <p>팀땃쥐. All rights reserved.</p>
    </footer>
</div>
<script>
  document.getElementById('login-btn').addEventListener('keydown', (evt) => {
    if (evt.key === 'Enter') {
      evt.preventDefault();
      document.forms['login-form'].submit();
    }
  });

  function domain_remove(email) {
    email = email.trim();
    let atIndex = email.indexOf('@');
    if (atIndex !== -1) {
      return email.substring(0, atIndex);
    }
    return email;
  }

  const email = document.getElementById('login-email');
  const email_select = document.getElementById('email-select');
  email_select.addEventListener('change', (evt) => {
    if (evt.target.value !== 'none') {
      email.value = domain_remove(email.value);
      const e = email.value + '@' + email_select.value;
      email.value = e;
    } else {
      email.value = '';
    }
  });

  $(function () {
    $('.eyes').on('click', function () {

      $('.password').toggleClass('active');

      if ($('.password').hasClass('active') === true) {
        $(this).find('.fa-eye').attr('class', "fa-regular fa-eye-slash").parents('.password').find(
            '#login-password').attr('type', 'text');
      } else {
        $(this).find('.fa-eye-slash').attr('class', "fa-regular fa-eye").parents('.password').find(
            '#login-password').attr('type', 'password');
      }
    })
  })
  const emailMsg = document.querySelector('.login-email-msg');
  const passwordMsg = document.querySelector('.login-password-msg');

    const loginBtn = document.getElementById('login-btn');
  const memberCheck = () => {
    const emailMsg = document.querySelector('.login-email-msg');
    const pwdMsg = document.querySelector('.login-password-msg');
    $.ajax({
      url: '/member/member.do?method=memberCheck',
      type: 'POST',
      data: {email: $('#login-email').val(),
      password:$('#login-password').val()
      },
      success: (data) => {
        if (data.result === 1) {
          document.getElementById('loginForm').submit();
        }else if (data.result === 0){
          loginBtn.type = 'button';
          emailMsg.classList.remove('hide');
          pwdMsg.classList.add('hide');
        }else if (data.result ===-1){
          loginBtn.type = 'button';
          emailMsg.classList.add('hide');
          pwdMsg.classList.remove('hide');
        }else {
          loginBtn.type = 'button';
          console.log('DB오류')
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  const password = document.getElementById('login-password');
 loginBtn.addEventListener('click',memberCheck);
  email.addEventListener('keydown', (evt) => {if (evt.key === 'Enter') {memberCheck()}})
  password.addEventListener('keydown', (evt) => {if(evt.key === 'Enter'){memberCheck()}})
</script>
</body>
</html>

