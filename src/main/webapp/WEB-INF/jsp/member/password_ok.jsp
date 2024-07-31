<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
      .hide {
          display: none;
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
  </style>
</head>
<body>
<form id="passwordForm" action="/member/member.do?method=passwordCheck" method="post">
  <fieldset class="password">
    <input type="password" id="login-password" name="password" placeholder="비밀번호"/>
    <div class="eyes"><i class="fa-regular fa-eye"></i></div>
  </fieldset>
  <div class="login-password-msg hide">비밀번호가 잘못되었습니다. 비밀번호를 정확히 입력해 주세요.</div>
  <fieldset>
    <button id="login-btn" class="login" type="button" onclick="passwordCheck()">확인</button>
  </fieldset>
</form>

<script>
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
  const passwordMsg = document.querySelector('.login-password-msg');
  const passwordCheck = () => {

    const pwdMsg = document.querySelector('.login-password-msg');
    $.ajax({
      url: '/member/member.do?method=passwordCheck',
      type: 'POST',
      data: {
        password: $('#login-password').val()
      },
      success: (data) => {
        if (data.result === 1) {

        } else if (data.result === 0) {

          pwdMsg.classList.add('hide');
        } else if (data.result === -1) {

          pwdMsg.classList.remove('hide');
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error('Error:', textStatus, errorThrown);
      },
    });
  };

</script>

</body>
</html>
