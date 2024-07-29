import {getReviewsByBoardPk} from "./review-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');

// 모든 리뷰 보기
$('#allReviewBtn').click(() => {
  $('ul').load('http://localhost:8080/async_page/review_page.jsp')
  getReviewsByBoardPk(boardPk);
})
