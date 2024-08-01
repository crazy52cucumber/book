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