import {modal} from "./modal.js";
import {checkCookie} from "./content-api.js";
import {viewTarget} from "./infinity_scroll.js";
import {drwaReview} from "./draw.js";
import {getReviewsByBoardPk} from "./review/review-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');

// 모든 리뷰 보기
$(document).on('click', '.bottom-menu-item a:nth-child(2), #allReviewBtn', async (e) => {
  $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
  const data = await getReviewsByBoardPk(boardPk);
  const obj = JSON.parse(data);

  $('.review-list').html(drwaReview(obj));
  viewTarget($('footer'), boardPk);
})


const reviewAEle = $('li a');
reviewAEle.each((idx, item) => {
  modal(item);
});

$('section').on('click', '.review-btn', async (e) => {
  e.stopPropagation();
  const flag = await isLogin();
  if (!flag) {
    alert("로그인 후 이용 가능합니다.")
    return;
  }

  // 요일이 지난거에만 리뷰가 작성되게끔,


  location.href = `/reviews/write?seq=${boardPk}`
})

const isLogin = async () => {
  const data = await checkCookie();
  const obj = JSON.parse(data);
  if (obj.result === '0') return false;
  else return true;
}

const isLogin = async () => {
  const data = await checkCookie();
  const obj = JSON.parse(data);
  if (obj.result === '0') return false;
  else return true;
}

