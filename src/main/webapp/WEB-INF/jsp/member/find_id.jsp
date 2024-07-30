<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        background-image: url('https://i.ytimg.com/vi/MzwaGilR9Oo/maxresdefault.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        width: 100vw;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .container {
        background: #ffffff;
        border: 1px solid black;
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      fieldset{
        display: flex;
        justify-content: center;
        margin: 10px;
        padding: 10px 12px;
      }
      button{
        margin-right: 5px;
      }
      .hide{
        display: none;
      }
    </style>
</head>
<body>
<div class="container" style="width: 600px">
    <h1>아이디 찾기</h1>
    <form action="/member/member.do?method=myId" method="post">
        <fieldset><input type="text" placeholder="이름"  id="name" name="name"></fieldset>
        <div class="msg input-name hide">이름을 입력해주세요</div>
        <fieldset><input type="text" placeholder="전화번호"  id="phone" name="phone">
        </fieldset>
        <div class="msg input-phone hide">010으로 시작하는 번호를 '-' 없이 입력해주세요</div>
        <fieldset>
            <button type="button" class="btn btn-dark" id="find-id">아이디 찾기</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</div>

<script>
  document.getElementById('cancel').addEventListener('click',()=>{
    history.back()
  })

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
    const pattern = /^010\d{8}$/;
    return pattern.test(nickname);
  }

  name.addEventListener('keyup', checkName);
  phone.addEventListener('keyup', checkPhone);

  const checkFormValidity = ()=>{
    const findIdBtn = document.getElementById('find-id')
    const isNameValid = name.value.trim() !== '';
    const isPhoneValid = validatePhone(phone.value);

    if(isNameValid && isPhoneValid){
      findIdBtn.type = 'submit';
    }else {
      findIdBtn.type = 'button';
    }
  }

  $('input[type="text"]').keydown((event) => {
    if (event.keyCode === 13) {
      event.preventDefault();
    }
  });
</script>
</body>
</html>
