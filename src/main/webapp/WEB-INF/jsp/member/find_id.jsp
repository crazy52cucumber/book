<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <style>
      html, body {
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
      }
      main{
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
        align-self:center;
      }
      select{
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
      .need-top{
        margin-top: 16px;
      }
      fieldset{
        margin-top: 16px;
        display: flex;
        justify-content: center;
      }
    </style>
</head>
<body>
<div class="container" style="width: 600px">
    <form action="/member/member.do?method=myId" method="post">
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="name" name="name" placeholder="이름"/>
            <label for="name">이름</label>
        </div>
        <div class="msg input-name text-danger hide">이름을 입력해주세요</div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="phone" name="phone" placeholder="전화번호"/>
            <label for="phone">전화번호</label>
        </div>
        <div class="msg input-phone text-danger hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
        <fieldset>
            <button type="button" class="btn btn-dark" id="find-id">아이디 찾기</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</div>
<script>
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

</script>
</body>
</html>