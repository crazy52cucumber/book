<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-07-31
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
      .hide {
          display: none;
      }

      .active .password input {
          display: block;
      }

      .active .eyes .fa-eye-slash {
          display: block;
      }

      .eyes .fa-eye {
          display: none;
      }
  </style>
</head>
<body>
<h1>비밀번호 확인 완료</h1>
<form id="modifyForm" action="member.do?method=modify" method="post">
  <fieldset>
    <input placeholder="새 닉네임을 입력해주세요" name="modifiedNickname" id="modifiedNickname" autofocus required/>
  </fieldset>
  <div class="msg miss-nickname-msg hide">닉네임은 10글자 이하로 입력해주세요</div>
  <div class="msg input-nickname-msg hide">닉네임을 입력해주세요</div>
  <br/>

  <fieldset class="password">
    <input type="password" placeholder="새 비밀번호를 입력해주세요" id="modifiedPassword" name="modifiedPassword"/>
    <div class="eyes"><i class="fa-regular fa-eye"></i></div>
  </fieldset>
  <div class="msg fail-password-msg hide">8글자 이상, 영문 대소문자 숫자, 특수문자(@$!%*#?&)를 포함해주세요</div>
  <div class="msg input-password-msg hide">비밀번호를 입력해주세요</div>
  <br/>

  <fieldset>
    <input type="password" name="password-retype" id="password-retype" placeholder="비밀번호 확인" required/>
  </fieldset>
  <div class="msg miss-pwd-msg hide">비밀번호가 일치하지 않습니다</div>
  <div class="msg input-password-retype-msg hide">비밀번호 확인을 입력해주세요</div>

  <fieldset>
    <button id="btn" type="button">수정하기</button>
  </fieldset>
</form>

<script>
  const nicknameInput = document.getElementById('modifiedNickname');
  const password = document.getElementById('modifiedPassword');
  const passwordRetype = document.getElementById('password-retype');
  const btn = document.getElementById('btn');

  function validateNickname(nickname) {
    return nickname.length > 0 && nickname.length <= 10;
  }

  function validatePassword(password) {
    const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    return pattern.test(password);
  }

  function validatePasswordRetype(password, passwordRetype) {
    return password === passwordRetype;
  }

  const checkNickname = () => {
    const failNicknameMsg = document.querySelector('.miss-nickname-msg');
    const inputNicknameMsg = document.querySelector('.input-nickname-msg');
    if (validateNickname(nicknameInput.value)) {
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.add('hide');
    } else if (nicknameInput.value === '') {
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.remove('hide');
    } else {
      failNicknameMsg.classList.remove('hide');
      inputNicknameMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  const checkPassword = () => {
    const failPasswordMsg = document.querySelector('.fail-password-msg');
    const inputPasswordMsg = document.querySelector('.input-password-msg');
    if (validatePassword(password.value)) {
      failPasswordMsg.classList.add('hide');
      inputPasswordMsg.classList.add('hide');
    } else if (password.value === '') {
      failPasswordMsg.classList.add('hide');
      inputPasswordMsg.classList.remove('hide');
    } else {
      failPasswordMsg.classList.remove('hide');
      inputPasswordMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  const checkPasswordRetype = () => {
    const failRetypePasswordMsg = document.querySelector('.miss-pwd-msg');
    const inputPasswordRetypeMsg = document.querySelector('.input-password-retype-msg');
    if (validatePasswordRetype(password.value, passwordRetype.value)) {
      failRetypePasswordMsg.classList.add('hide');
      inputPasswordRetypeMsg.classList.add('hide');
    } else if (passwordRetype.value === '') {
      failRetypePasswordMsg.classList.add('hide');
      inputPasswordRetypeMsg.classList.remove('hide');
    } else {
      failRetypePasswordMsg.classList.remove('hide');
      inputPasswordRetypeMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  const checkFormValidity = () => {
    const isPasswordValid = validatePassword(password.value);
    const isPasswordRetypeValid = validatePasswordRetype(password.value, passwordRetype.value);
    const isNicknameValid = validateNickname(nicknameInput.value);

    if (isPasswordValid && isPasswordRetypeValid && isNicknameValid) {
      btn.type = 'submit';
    } else {
      btn.type = 'button';
    }
  };

  nicknameInput.addEventListener('keyup', checkNickname);
  password.addEventListener('keyup', checkPassword);
  passwordRetype.addEventListener('keyup', checkPasswordRetype);

  btn.addEventListener('click', () => {
    checkPassword();
    checkPasswordRetype();
    checkNickname();
  });

  document.querySelectorAll('input').forEach((input) => {
    input.addEventListener('keyup', (event) => {
      if (event.key === 'Enter') {
        event.preventDefault();
        btn.click();
      }
    });
  });

  $(function () {
    $('.eyes').on('click', function () {
      $('.password').toggleClass('active');
      if ($('.password').hasClass('active')) {
        $(this).find('.fa-eye').attr('class', "fa-regular fa-eye-slash").parents('.password').find('#modifiedPassword').attr('type', 'text');
      } else {
        $(this).find('.fa-eye-slash').attr('class', "fa-regular fa-eye").parents('.password').find('#modifiedPassword').attr('type', 'password');
      }
    });
  });
</script>

</body>
</html>
