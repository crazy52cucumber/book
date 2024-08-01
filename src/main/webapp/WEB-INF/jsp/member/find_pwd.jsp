<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/jsp/common/reverse_login_module.jsp"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
<div class="container">
    <form action="/member/member.do?method=myPwd" method="post">
        <div class="form-floating input-group mb-3">
            <input type="email" id="email" name="email" class="form-control" aria-label="Text input with dropdown button" placeholder="name@example.com" >
            <label for="email">이메일</label>
            <select title="email" id="email-select">
                <option class="option" value="none">직접입력</option>
                <option class="option" value="naver.com">naver.com</option>
                <option class="option" value="gmail.com">gmail.com</option>
            </select>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control need-top" id="name" name="name" placeholder="이름"/>
            <label for="name">이름</label>
        </div>
        <div class="msg duplicated-email text-danger hide">
            가입된 정보가 없습니다. 다시 입력해주세요
        </div>
        <fieldset>
            <button type="button" class="btn btn-dark" id="find-pwd">비밀번호 찾기</button>
            <button type="button" class="btn btn-outline-dark" id="cancel">취소</button>
        </fieldset>
    </form>
</div>
<script>
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
</script>
</body>
</html>