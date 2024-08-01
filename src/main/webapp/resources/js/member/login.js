document.getElementById('cancel').addEventListener('click',()=>location.href='/');
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
  const password = document.getElementById('login-password');
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
        email.classList.add('is-invalid')
        password.classList.remove('is-invalid')
        pwdMsg.classList.add('hide');
      }else if (data.result ===-1){
        loginBtn.type = 'button';
        emailMsg.classList.add('hide');
        pwdMsg.classList.remove('hide');
        password.classList.add('is-invalid');
        email.classList.remove('is-invalid');
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