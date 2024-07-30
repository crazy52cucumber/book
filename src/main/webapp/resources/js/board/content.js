import {drawModal} from "./modal.js";

// 유리

// 수완
const reviewAEle = $('li a');
reviewAEle.each((idx, item) => {
  drawModal(item);
});

$('section').on('click', '.review-btn', e => {
  e.stopPropagation();
  const memberCookie = document.cookie;
  const cookieArr = memberCookie.split(";");
  const cookies = cookieArr.map(e => e.split("="));

  let isLogin = false;
  for (const cookie of cookies) {
    if (cookie[0].trim().startsWith('member')) {
      isLogin = true;
    }
  }
  if (!isLogin) {
    alert("로그인 후 이용 가능합니다.")
    return;
  }
  $('.modal-container').css('display', 'block')
})