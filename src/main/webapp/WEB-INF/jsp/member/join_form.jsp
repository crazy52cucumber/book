<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
      html, body {
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
      }

      main {
        width: 500px;
        height: 100vh;
        border: 1px solid #000;
        box-sizing: border-box;
      }

      form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        border: 5px solid #000;
        width: 500px;
        height: 100vh;
        align-self: center;
      }

      select {
        border: #dddddd 1px solid;
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
        overflow: hidden;
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

      .need-top {
        margin-top: 16px;
      }

      fieldset {
        margin-top: 16px;
        display: flex;
        justify-content: center;
      }
    </style>
</head>
<body>
<main>
    <form name="join-form" action="/member/member.do?method=join" method="post">
        <div class="form-floating input-group mb-3">
            <input type="email" id="email" name="email" class="form-control"
                   aria-label="Text input with dropdown button" placeholder="name@example.com"
                   autofocus>
            <input type="hidden" id="emailHidden" name="emailHidden">
            <label for="email">이메일</label>
            <select title="email" id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver.com">naver.com</option>
                <option class="option" value="gmail.com">gmail.com</option>
            </select>
            <button class="btn btn-outline-secondary" type="button" id="authSendBtn">인증하기</button>
        </div>
        <div class="msg miss-email text-danger hide">올바른 이메일 형식을 입력해주세요</div>
        <div class="msg input-email text-danger hide">이메일을 입력해주세요</div>
        <div class="msg duplicated-email text-danger hide">동일한 이메일이 있습니다. 다른 이메일을 입력해주세요</div>
        <div class="form-floating input-group mb-3">
            <input type="text" class="form-control" id="authenticCode" name="authenticCode"
                   placeholder="인증번호"/>
            <label for="authenticCode">인증번호</label>
            <button class="btn btn-outline-secondary" type="button" id="authConfirmBtn">인증하기
            </button>
        </div>
        <div class="msg input-authCode text-success hide">인증이 완료되었습니다</div>
        <div class="msg fail-authCode text-danger hide">인증 코드가 맞지않습니다. 다시 입력해주세요</div>
        <div class="msg fail-authCode2 text-danger hide">이메일 인증을 먼저 해주세요</div>
        <div class="form-floating password">
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="비밀번호"/>
            <div class="eyes"><i class="fa-regular fa-eye"></i></div>
            <label for="password">비밀번호</label>
        </div>
        <div class="msg fail-password-msg text-danger hide">
            8글자 이상, 영문 대소문자 숫자, 특수문자(@$!%*#?&)를 포함해주세요
        </div>
        <div class="msg input-password text-danger hide">비밀번호를 입력해주세요</div>
        <div class="form-floating">
            <input type="password" class="form-control need-top" id="password-retype"
                   name="password-retype" placeholder="비밀번호 확인"/>
            <label for="password-retype">비밀번호 확인</label>
        </div>
        <div class="msg miss-pwd text-danger hide">비밀번호가 일치하지 않습니다</div>
        <div class="msg input-password-retype text-danger hide">
            비밀번호 확인을 입력해주세요
        </div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="name" name="name"
                   placeholder="이름"/>
            <label for="name">이름</label>
        </div>
        <div class="msg input-name text-danger hide">이름을 입력해주세요</div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="phone" name="phone"
                   placeholder="전화번호"/>
            <label for="phone">전화번호</label>
        </div>
        <div class="msg input-phone text-danger hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
        <div class="msg duplicated-phone text-danger hide">동일한 번호로 가입한 계정이 존재합니다</div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="nickname" name="nickname"
                   placeholder="닉네임"/>
            <label for="nickname">닉네임</label>
        </div>
        <div class="msg miss-nickname text-danger hide">닉네임은 10글자 이하로 입력해주세요</div>
        <div class="msg input-nickname text-danger hide">닉네임을 입력해주세요</div>
        <fieldset class="join">
            <button type="button" class="btn btn-dark" id="join">회원가입</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</main>
<script>
  document.getElementById('cancel').addEventListener('click', () => {
    location.href = '/member/member.do?method=login'
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
      email.classList.remove('is-invalid')
      email.classList.add('is-valid')
      failEmailMsg.classList.add('hide');
      inputEmailMsg.classList.add('hide');
    } else if (emailInput.value === '') {
      email.classList.remove('is-valid')
      email.classList.add('is-invalid')
      failEmailMsg.classList.add('hide');
      inputEmailMsg.classList.remove('hide');
    } else {
      email.classList.remove('is-valid')
      email.classList.add('is-invalid')
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
      password.classList.remove('is-invalid');
      password.classList.add('is-valid');
    } else if (password.value === '') {
      password.classList.remove('is-valid');
      failPasswordMsg.classList.add('hide');
      inputPasswordMsg.classList.remove('hide');
      password.classList.add('is-invalid');
    } else {
      password.classList.remove('is-valid');
      failPasswordMsg.classList.remove('hide');
      inputPasswordMsg.classList.add('hide');
      password.classList.add('is-invalid');
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
      passwordRetype.classList.remove('is-invalid')
      passwordRetype.classList.add('is-valid')
    } else if (passwordRetype.value === '') {
      passwordRetype.classList.remove('is-valid')
      failRetypePasswordMsg.classList.add('hide');
      inputPasswordRetypeMsg.classList.remove('hide');
      passwordRetype.classList.add('is-invalid')
    } else {
      passwordRetype.classList.remove('is-valid')
      failRetypePasswordMsg.classList.remove('hide');
      inputPasswordRetypeMsg.classList.add('hide');
      passwordRetype.classList.add('is-invalid')
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
      phone.classList.remove('is-invalid')
      phone.classList.add('is-valid')
    } else {
      phone.classList.remove('is-valid')
      failPhoneMsg.classList.remove('hide');
      phone.classList.add('is-invalid')
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
      name.classList.add('is-invalid')
      name.classList.remove('is-valid')
    } else {
      name.classList.add('is-valid')
      inputNameMsg.classList.add('hide');
      name.classList.remove('is-invalid')
    }
    checkFormValidity();
  };

  const checkNickname = () => {
    const failNicknameMsg = document.querySelector('.miss-nickname');
    const inputNicknameMsg = document.querySelector('.input-nickname');
    if (validateNickname(nickName.value)) {
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.add('hide');
      nickName.classList.remove('is-invalid')
      nickName.classList.add('is-valid')
    } else if (nickName.value === '') {
      nickName.classList.remove('is-valid')
      failNicknameMsg.classList.add('hide');
      inputNicknameMsg.classList.remove('hide');
      nickName.classList.add('is-invalid')
    } else {
      nickName.classList.remove('is-valid')
      failNicknameMsg.classList.remove('hide');
      inputNicknameMsg.classList.add('hide');
      nickName.classList.add('is-invalid')
    }
    checkFormValidity();
  };

  nickName.addEventListener('keyup', checkNickname);
  name.addEventListener('keyup', checkName);

  function checkEmailAuth() {
    if (isAuth) {
      document.querySelector('.fail-authCode').classList.add('hide');
      document.getElementById('authenticCode').classList.remove('is-invalid')
      document.getElementById('authenticCode').classList.add('is-valid')
    } else {
      document.getElementById('authenticCode').classList.remove('is-valid')
      document.querySelector('.fail-authCode').classList.remove('hide');
      document.getElementById('authenticCode').classList.add('is-invalid')
    }
  }

  const duplicatedPhoneMsg = document.querySelector('.duplicated-phone');

  function duplicatedPhone() {
    return duplicatedPhoneMsg.classList.contains('hide');
  }

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
    const isPhoneDuplicated = duplicatedPhone();
    if (
        isEmailValid &&
        isPasswordValid &&
        isPasswordRetypeValid &&
        isNicknameValid &&
        isNameValid &&
        isPhoneValid &&
        isAuth &&
        isPhoneDuplicated
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
    phoneCheck();
    checkEmailAuth();
  });

  joinBtn.addEventListener('keydown', (evt) => {
    evt.target.ENTER;
  });

  const emailCheck = () => {
    $.ajax({
      url: '/member/member.do?method=emailCheck',
      type: 'POST',
      data: {email: $('#email').val()},
      success: (data) => {
        if (data.valid === 0) {
          document.querySelector('.duplicated-email').classList.remove('hide');
          email.classList.add('is-invalid')
        } else {
          document.querySelector('.duplicated-email').classList.add('hide');
          email.classList.remove('is-invalid')
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  $('#email').on('keyup', emailCheck);
  $('#email-select').on('change', emailCheck);

  const phoneCheck = () => {
    $.ajax({
      url: '/member/member.do?method=phoneCheck',
      type: 'POST',
      data: {phone: $('#phone').val()},
      success: (data) => {
        if (data.valid === 0) {
          document.querySelector('.duplicated-phone').classList.remove('hide');
          phone.classList.add('is-invalid')
        } else {
          document.querySelector('.duplicated-phone').classList.add('hide');

        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  $('#phone').on('keyup', phoneCheck);

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
      url: '/member/member.do?method=authEmail',
      type: 'POST',
      data: {email: $('#email').val()},
      success: (data) => {
        $('#email').on('keyup', () => {
          document.getElementById('emailHidden').value = data.email;
          auth(data.code, data.email)

        });
        document.getElementById('emailHidden').value = data.email;
        auth(data.code, data.email)
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  const disableEmailInput = () => {
    emailInput.disabled = true;
    emailSelect.disabled = true;
  };
  let isAuth = false;

  function auth(code, email) {
    document.getElementById('authConfirmBtn').addEventListener('click', () => {
      if (code === $('#authenticCode').val() && email === $('#email').val()) {
        document.querySelector('.input-authCode').classList.remove('hide');
        document.querySelector('.fail-authCode').classList.add('hide');
        document.getElementById('authenticCode').classList.remove('is-invalid')
        document.getElementById('authenticCode').classList.add('is-valid')
        disableEmailInput();
        isAuth = true;
      } else {
        document.getElementById('authenticCode').classList.remove('is-valid')
        document.querySelector('.input-authCode').classList.add('hide');
        document.querySelector('.fail-authCode').classList.remove('hide');
        document.getElementById('authenticCode').classList.add('is-invalid')
        isAuth = false;
      }
      checkFormValidity();
    })
  }

function success(){
  const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: 'success',
    title: '인증번호가 정상적으로 보내졌습니다 :)'
  })
}

  function fail(){
    const Toast = Swal.mixin({
      toast: true,
      position: 'center-center',
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: 'error',
      title: '이메일을 다시 확인해주세요'
    })
  }


  document.getElementById('authSendBtn').addEventListener('click', () => {

    const isEmailValid = validateEmail(emailInput.value);
    const isEmailDuplicated = document.querySelector('.duplicated-email').classList.contains(
        'hide');
    if (isEmailValid && isEmailDuplicated) {
      document.getElementById('emailHidden').value
      success();
      authenticEmail();
    } else {
      fail();
    }
  })

  document.getElementById('authConfirmBtn').addEventListener('click', () => {
        checkFormValidity();
        const isEmailValid = validateEmail(emailInput.value);
        if (!isEmailValid) {
          document.querySelector('.fail-authCode2').classList.remove('hide');
          document.querySelector('.fail-authCode').classList.add('hide');
          document.getElementById('authenticCode').classList.add('is-invalid')
        } else {
          document.querySelector('.fail-authCode2').classList.add('hide');
          document.getElementById('authenticCode').classList.remove('is-invalid')
        }
      }
  )
</script>
</body>
</html>