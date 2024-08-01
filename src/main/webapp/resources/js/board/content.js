import {modal} from "./modal.js";
import {checkCookie, checkValid, checkWrite} from "./content-api.js";
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
  let flag = await isLogin();
  if (!flag) {
    alert("로그인 후 이용 가능합니다.")
    return;
  }

  // 이미 달았는지 확인
  //flag =
  flag = await isWrite();
  if (!flag) {
    alert("이미 작성하셨습니다.")
    return;
  }

  // 요일이 지난거에만 리뷰가 작성되게끔,
  flag = await isValid();
  if (flag === -1) return;
  if (!flag) {
    alert("수강 이후 작성이 가능합니다.")
    return;
  }


  location.href = `/reviews/write?seq=${boardPk}`
})

const isLogin = async () => {
  const data = await checkCookie();
  const obj = JSON.parse(data);
  if (obj.result === '0') return false;
  else return true;
}

const isValid = async () => {
  const data = await checkValid(boardPk);
  const obj = JSON.parse(data);
  if (obj.result === '-1') {
    alert("예약 신청이 안되어 있습니다.")
    return -1;
  }
  if (obj.result === '0') return false;
  else return true;
}

const isWrite = async () => {
  const data = await checkWrite(boardPk);
  const obj = JSON.parse(data);
  console.log(data)
  if (obj.result === '0') return false;
  else return true;
}