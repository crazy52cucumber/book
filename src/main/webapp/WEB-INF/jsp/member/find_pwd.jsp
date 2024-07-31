<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

      fieldset {
        display: flex;
        justify-content: center;
        margin: 10px;
        padding: 10px 12px;
      }

      button {
        margin-right: 5px;
      }

      .hide {
        display: none;
      }
    </style>
</head>
<body>
<div class="container">
    <h1>비밀번호 찾기</h1>
    <form action="/member/member.do?method=myPwd" method="post">
        <fieldset><input type="text" id="email" title="이메일" name="email" placeholder="이메일">
        </fieldset>
        <fieldset><input type="text" id="name" title="이름" name="name" placeholder="이름"></fieldset>
        <div class="msg duplicated-email hide">
            가입된 정보가 없습니다. 다시 입력해주세요
        </div>
        <fieldset>
            <button type="button" class="btn btn-dark" id="find-pwd">비밀번호 찾기</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</div>
<script>
  document.getElementById('cancel').addEventListener('click', () => location.href = '/member/member.do?method=login')
const findPwdBtn = document.getElementById('find-pwd');
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
          findPwdBtn.type = 'submit'
        } else {
          document.querySelector('.duplicated-email').classList.remove('hide');
          findPwdBtn.type = 'button'
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };
  $('#name').on('change', emailCheck);
  $('#email').on('keydown', ()=> document.querySelector('.duplicated-email').classList.add('hide'));
  $('#name').on('keydown', ()=> document.querySelector('.duplicated-email').classList.add('hide'));
findPwdBtn.addEventListener('click',()=>{
  if(findPwdBtn.type === 'button'){
    document.querySelector('.duplicated-email').classList.remove('hide')
  }else {
    document.querySelector('.duplicated-email').classList.add('hide')
  }
})
</script>
</body>
</html>