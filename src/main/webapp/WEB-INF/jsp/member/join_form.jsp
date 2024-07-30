<%@ page import="static member.util.SignupConst.SUCCESS" %>
<%@ page import="static member.util.SignupConst.FAILURE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Email Validation</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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

      body {
        min-height: 100%;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }


      nav {
        border: 1px solid #000;
        box-sizing: border-box;
      }

      .main,
      form {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      fieldset,
      div {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 10px;
        padding: 10px 12px;
        border: none;
      }

      fieldset,
      .msg {
        width: 400px;
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

      button {
        margin-right: 5px;
      }
    </style>
</head>
<body>
<main style="width: 600px">
    <form name="join-form" action="/member/member.do?method=join" method="post">
        <div id="liveAlertPlaceholder"></div>
        <fieldset>
            <input type="email" name="email" id="email" placeholder="이메일" autofocus required/>
            <button type="button" class="btn btn-outline-dark" id="authSendBtn">인증코드 받기</button>
        </fieldset>
        <div class="msg miss-email hide">올바른 이메일 형식을 입력해주세요</div>
        <div class="msg input-email hide">이메일을 입력해주세요</div>
        <div class="msg duplicated-email hide">
            동일한 이메일이 있습니다. 다른 이메일을 입력해주세요
        </div>
        <fieldset class="select">
            <select id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver.com">naver.com</option>
                <option class="option" value="gmail.com">gmail.com</option>
            </select>
        </fieldset>
        <fieldset><input type="text" name="authenticCode" id="authenticCode" placeholder="인증번호"
                         required/>
            <button type="button" class="btn btn-outline-dark" id="authConfirmBtn">인증하기</button>
        </fieldset>
        <div class="msg input-authCode hide">인증이 완료되었습니다</div>
        <div class="msg fail-authCode hide">인증 코드가 맞지않습니다. 다시 입력해주세요</div>
        <fieldset class="password">
            <input type="password" name="password" id="password" placeholder="비밀번호" required/>
            <div class="eyes"><i class="fa-regular fa-eye"></i></div>
        </fieldset>
        <div class="msg fail-password-msg hide">
            8글자 이상, 영문 대소문자 숫자, 특수문자(@$!%*#?&)를 포함해주세요
        </div>
        <div class="msg input-password hide">비밀번호를 입력해주세요</div>
        <fieldset>
            <input type="password" name="password-retype" id="password-retype" placeholder="비밀번호 확인" required/>
        </fieldset>
        <div class="msg miss-pwd hide">비밀번호가 일치하지 않습니다</div>
        <div class="msg input-password-retype hide">
            비밀번호 확인을 입력해주세요
        </div>
        <fieldset><input type="text" name="name" id="name" placeholder="이름" required/>
        </fieldset>
        <div class="msg input-name hide">이름을 입력해주세요</div>
        <fieldset>
            <input type="text" name="phone" id="phone" placeholder="전화번호" required/>
        </fieldset>
        <div class="msg input-phone hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
        <fieldset>
            <input type="text" name="nickname" id="nickname" placeholder="닉네임" required/>
        </fieldset>
        <div class="msg miss-nickname hide">닉네임은 10글자 이하로 입력해주세요</div>
        <div class="msg input-nickname hide">닉네임을 입력해주세요</div>
        <fieldset class="join">
            <button type="button" class="btn btn-dark" id="join">회원가입</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</main>
<script>
  document.getElementById('cancel').addEventListener('click', () => {
    history.back()
  })

  function domain_remove(email) {
    email = email.trim();
    let atIndex = email.indexOf('@');
    if (atIndex !== -1) {
      return email.substring(0, atIndex);
    }
    return email;
  }

  const emailInput = document.getElementById('email');
  const emailSelect = document.getElementById('email-select');

  emailSelect.addEventListener('change', (evt) => {
    if (evt.target.value !== 'none') {
      emailInput.value = domain_remove(emailInput.value);
      const e = emailInput.value + '@' + emailSelect.value;
      emailInput.value = e;
    } else {
      emailInput.value = '';
    }
    checkEmail();
    checkFormValidity();
  });

  function validateEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailRegex.test(email);
  }

  const checkEmail = () => {
    const failEmailMsg = document.querySelector('.miss-email');
    const inputEmailMsg = document.querySelector('.input-email');
    if (validateEmail(emailInput.value)) {
      failEmailMsg.classList.add('hide');
      inputEmailMsg.classList.add('hide');
    } else if (emailInput.value === '') {
      failEmailMsg.classList.add('hide');
      inputEmailMsg.classList.remove('hide');
    } else {
      failEmailMsg.classList.remove('hide');
      inputEmailMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  emailInput.addEventListener('keyup', checkEmail);
  emailInput.addEventListener('change', checkEmail);

  function validatePassword(password) {
    const pattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    return pattern.test(password);
  }

  const checkPassword = () => {
    const failPasswordMsg = document.querySelector('.fail-password-msg');
    const inputPasswordMsg = document.querySelector('.input-password');
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

  const password = document.getElementById('password');
  const passwordRetype = document.getElementById('password-retype');

  function validatePasswordRetype(password, passwordRetype) {
    return password === passwordRetype;
  }

  const checkPasswordRetype = () => {
    const failRetypePasswordMsg = document.querySelector('.miss-pwd');
    const inputPasswordRetypeMsg = document.querySelector(
        '.input-password-retype'
    );
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

  password.addEventListener('keyup', checkPassword);
  passwordRetype.addEventListener('keyup', checkPasswordRetype);

  const phone = document.getElementById('phone');

  function validatePhone(phone) {
    const pattern = /^010\d{8}$/;
    if (pattern.test(phone)) {
      return true;
    } else {
      return false;
    }
  }

  const checkPhone = () => {
    const failPhoneMsg = document.querySelector('.input-phone');
    if (validatePhone(phone.value)) {
      failPhoneMsg.classList.add('hide');
    } else {
      failPhoneMsg.classList.remove('hide');
    }
    checkFormValidity();
  };
  phone.addEventListener('keyup', checkPhone);
  const nickName = document.getElementById('nickname');

  function validateNickname(nickname) {
    const pattern = /^.{1,10}$/;
    return pattern.test(nickname);
  }

  const name = document.getElementById('name');

  const checkName = () => {
    const inputNameMsg = document.querySelector('.input-name');
    if (name.value === '') {
      inputNameMsg.classList.remove('hide');
    } else {
      inputNameMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  const checkNickname = () => {
    const failNicknameMsg = document.querySelector('.miss-nickname');
    const inputNicknameMsg = document.querySelector('.input-nickname');
    if (validateNickname(nickName.value)) {
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.add('hide');
    } else if (nickName.value === '') {
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.remove('hide');
    } else {
      failNicknameMsg.classList.remove('hide');
      inputNicknameMsg.classList.add('hide');
    }
    checkFormValidity();
  };

  nickName.addEventListener('keyup', checkNickname);
  name.addEventListener('keyup', checkName);

  const checkFormValidity = () => {
    const joinBtn = document.getElementById('join');
    const isEmailValid = validateEmail(emailInput.value);
    const isPasswordValid = validatePassword(password.value);
    const isPasswordRetypeValid = validatePasswordRetype(
        password.value,
        passwordRetype.value
    );
    const isPhoneValid = validatePhone(phone.value);
    const isNicknameValid = validateNickname(nickName.value);
    const isNameValid = name.value.trim() !== '';

    if (
        isEmailValid &&
        isPasswordValid &&
        isPasswordRetypeValid &&
        isNicknameValid &&
        isNameValid &&
        isPhoneValid
    ) {
      joinBtn.type = 'submit';
    } else {
      joinBtn.type = 'button';
    }
  };

  const joinBtn = document.getElementById('join');
  joinBtn.addEventListener('click', () => {
    checkEmail();
    checkPassword();
    checkPasswordRetype();
    checkPhone();
    checkName();
    checkNickname();
    emailCheck();
  });

  joinBtn.addEventListener('keydown', (evt) => {
    evt.target.ENTER;
  });

  const inputs = document.querySelectorAll('input');

  inputs.forEach((input) => {
    input.addEventListener('keyup', (event) => {
      if (event.key === 'Enter') {
        event.preventDefault();
        document.getElementById('join').click();
      }
    });
  });

  const emailCheck = () => {
    $.ajax({
      url: '/member/member.do?method=emailCheck',
      type: 'POST',
      data: {email: $('#email').val()},
      success: (data) => {
        if (data.valid === 0) {
          document
          .querySelector('.duplicated-email')
          .classList.remove('hide');
        } else {
          document.querySelector('.duplicated-email').classList.add('hide');
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  $('#email').on('keyup', emailCheck);
  $('#email-select').on('change', emailCheck);

  $(function () {
    $('.eyes').on('click', function () {

      $('.password').toggleClass('active');

      if ($('.password').hasClass('active') === true) {
        $(this).find('.fa-eye').attr('class', "fa-regular fa-eye-slash").parents('.password').find(
            '#password').attr('type', 'text');
      } else {
        $(this).find('.fa-eye-slash').attr('class', "fa-regular fa-eye").parents('.password').find(
            '#password').attr('type', 'password');
      }
    });
  });

  const authenticEmail = () => {
    $.ajax({
      url: '/member/member.do?method=authenticEmail',
      type: 'POST',
      data: {email: $('#email').val()},
      success: (data) => {

        auth(data.code)
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };

  function auth(data) {
    document.getElementById('authConfirmBtn').addEventListener('click', () => {
      if (data === $('#authenticCode').val()) {
        document.querySelector('.input-authCode').classList.remove('hide');
        document.querySelector('.fail-authCode').classList.add('hide');
      } else {
        document.querySelector('.input-authCode').classList.add('hide');
        document.querySelector('.fail-authCode').classList.remove('hide');
      }
    })
  }

  const alertPlaceholder = document.getElementById('liveAlertPlaceholder')
  const appendAlert = (message, type) => {
    const wrapper = document.createElement('div')
    wrapper.innerHTML = [
      '<div class="alert alert-primary alert-dismissible" role="alert">',
      '   <div>인증번호를 보냈습니다</div>',
      '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
      '</div>'
    ].join('')

    alertPlaceholder.append(wrapper)
  }

  const appendAlertReverse = (message, type) => {
    const wrapper = document.createElement('div')
    wrapper.innerHTML = [
      '<div class="alert alert-danger alert-dismissible" role="alert">',
      '   <div>알맞은 이메일을 입력해주세요</div>',
      '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
      '</div>'
    ].join('')

    alertPlaceholder.append(wrapper)
  }

  const alertTrigger = document.getElementById('authSendBtn')
  if (alertTrigger) {
    alertTrigger.addEventListener('click', () => {
      const isEmailValid = validateEmail(emailInput.value);
      if (isEmailValid) {
        appendAlert('message', 'success');
        authenticEmail();
      } else {
        appendAlertReverse('message', 'fail')
      }
    })
  }
  // $('#email-select').on('change', emailCheck);
</script>
</body>
</html>
