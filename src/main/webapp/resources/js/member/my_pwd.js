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
      isPasswordRetypeValid &&
      isAuth
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

let isAuth = false;
const authenticCode = document.getElementById('authenticCode');

document.getElementById('authConfirmBtn').addEventListener('click',()=>{
  if(authenticCode.value === '${code}'){
    document.querySelector('.input-authCode').classList.remove('hide');
    document.querySelector('.fail-authCode').classList.add('hide');
    document.getElementById('authenticCode').classList.remove('is-invalid')
    document.getElementById('authenticCode').classList.add('is-valid')
    const newInput = document.createElement('input');
    newInput.type = 'hidden';
    newInput.name = 'hiddenEmail';
    newInput.value = '${email}';
    document.querySelector('.emailDiv').appendChild(newInput);
    isAuth = true;
  }else {
    document.getElementById('authenticCode').classList.remove('is-valid')
    document.querySelector('.input-authCode').classList.add('hide');
    document.querySelector('.fail-authCode').classList.remove('hide');
    document.getElementById('authenticCode').classList.add('is-invalid')
    isAuth = false;
  }
  checkFormValidity();
})


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