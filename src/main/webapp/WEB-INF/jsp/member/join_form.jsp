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


      .hide {
        display: none;
      }
    </style>
</head>
<body>
<main>
    <form name="join-form" action="/member/member.do?method=join" method="post">
        <fieldset>
            <input type="email" name="email" id="email" placeholder="이메일"/>
        </fieldset>
        <div class="select">
            <select id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver">naver.com</option>
                <option class="option" value="gmail">gmail.com</option>
            </select>
        </div>

        <fieldset>
            <input type="password" name="password" id="password" placeholder="비밀번호" required/>
        </fieldset>
        <div class="str-pwd-msg hide">
            8글자 이상, 영문 소문자,대문자 숫자, 특수문자(@$!%*#?&)를 사용하세요
        </div>
        <fieldset>
            <input type="password" name="password-retype" id="password-retype"
                   placeholder="비밀번호 확인"/>
        </fieldset>
        <fieldset>
            <input type="text" name="name" id="name" placeholder="이름"/>
        </fieldset>
        <fieldset>
            <input type="text" name="nickname" id="nickname" placeholder="닉네임"/>
        </fieldset>

        <div class="miss-pwd hide">비밀번호가 일치하지 않습니다</div>
        <fieldset class="join">
            <button type="submit" id="join" onkeydown="submit()">회원가입</button>
        </fieldset>
    </form>
</main>
<script>
  function submit() {
    document.join - form.submit();
  }

  function domain_remove(email) {
    email = email.trim();
    let atIndex = email.indexOf('@');
    if (atIndex != -1) {
      return email.substring(0, atIndex);
    }
    return email
  }

  const email = document.getElementById('email');
  const email_select = document.getElementById('email-select');
  email_select.addEventListener('change', (evt) => {
        if (evt.target.value !== 'none') {
          email.value = domain_remove(email.value);
          const e = email.value + '@' + email_select.options[email_select.selectedIndex].innerText;
          email.value = e;
        } else {
          email.value = '';
        }
      }
  )

</script>
</body>
</html>
