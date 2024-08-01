document.getElementById('cancel').addEventListener('click', () => location.href = '/member/member.do?method=login')

const name = document.getElementById('name');

const checkName = () => {
  const inputNameMsg = document.querySelector('.input-name');
  if (name.value === '') {
    inputNameMsg.classList.remove('hide');
    name.classList.add('is-invalid')
  } else {
    inputNameMsg.classList.add('hide');
    name.classList.remove('is-invalid')
  }
  checkFormValidity();
};

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
  } else {
    failPhoneMsg.classList.remove('hide');
    phone.classList.add('is-invalid')
  }
  checkFormValidity();
};
const nickName = document.getElementById('nickname');

function validateNickname(nickname) {
  const pattern = /^010\d{8}$/;
  return pattern.test(nickname);
}

name.addEventListener('keyup', checkName);
phone.addEventListener('keyup', checkPhone);

const checkFormValidity = () => {
  const findIdBtn = document.getElementById('find-id')
  const isNameValid = name.value.trim() !== '';
  const isPhoneValid = validatePhone(phone.value);

  if (isNameValid && isPhoneValid) {
    findIdBtn.type = 'submit';
  } else {
    findIdBtn.type = 'button';
  }
}

const findIdBtn = document.getElementById('find-id');
joinBtn.addEventListener('click', () => {
  checkPhone();
  checkName();
});

findIdBtn.addEventListener('keydown', (evt) => {
  evt.target.ENTER;
});
