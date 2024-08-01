function domain_remove(email) {
  email = email.trim();
  let atIndex = email.indexOf('@');
  if (atIndex !== -1) {
    return email.substring(0, atIndex);
  }
  return email;
}

const email = document.getElementById('email');
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

document.getElementById('cancel').addEventListener('click', () => location.href = '/member/member.do?method=login')
const findPwdBtn = document.getElementById('find-pwd');
const inputContainers = document.querySelectorAll('input');
const emailCheck = () => {
  $.ajax({
    url: '/member/member.do?method=emailNameCheck',
    type: 'POST',
    data: {email: $('#email').val(),
      name: $('#name').val()
    },
    success: (data) => {
      if (data.valid === 0) {
        document.querySelector('.duplicated-email').classList.add('hide');
        inputContainers[0].classList.remove('is-invalid')
        inputContainers[1].classList.remove('is-invalid')
        findPwdBtn.type = 'submit'
      } else {
        inputContainers[1].classList.add('is-invalid')
        inputContainers[0].classList.add('is-invalid')
        document.querySelector('.duplicated-email').classList.remove('hide');
        findPwdBtn.type = 'button'
      }
    },
    error: (jqXHR, textStatus, errorThrown) => {
      console.error('Error:', textStatus, errorThrown);
    },
  });
};
$('#name').on('keyup', emailCheck);
findPwdBtn.addEventListener('click',()=>{
  if(findPwdBtn.type === 'button'){
    document.querySelector('.duplicated-email').classList.remove('hide')
  }else {
    document.querySelector('.duplicated-email').classList.add('hide')
  }
})