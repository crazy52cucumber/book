const nickName = document.getElementById('nickname');

function validateNickname(nickname) {
  const pattern = /^.{1,10}$/;
  return pattern.test(nickname);
}

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

document.getElementById('cancel').addEventListener('click',()=>location.href='/');
const checkFormValidity = () => {
  const modifyBtn = document.getElementById('modifyBtn');
  const isPasswordValid = validatePassword(password.value);
  const isPasswordRetypeValid = validatePasswordRetype(
      password.value,
      passwordRetype.value
  );
  if (
      isPasswordValid &&
      isPasswordRetypeValid
  ) {
    modifyBtn.type = 'submit';

  } else {
    modifyBtn.type = 'button';
  }
};

const modifyBtn = document.getElementById('modifyBtn');
modifyBtn.addEventListener('click', () => {
  checkPassword();
  checkPasswordRetype();
});

modifyBtn.addEventListener('keydown', (evt) => {
  evt.target.ENTER;
});
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