import {getReviewsByBoardPk} from "./review-api.js";
import {viewTarget} from "../infinity_scroll.js";
import {drwaReview} from "../draw.js";

const boardPk = new URLSearchParams(location.search).get('seq');

// 모든 리뷰 보기
$(document).on('click', '.bottom-menu-item a:nth-child(2), #allReviewBtn', async () => {
  $('footer').addClass('review-active')
  $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
  const data = await getReviewsByBoardPk(boardPk);
  const jsonData = JSON.parse(data);
  $('.review-list').html(drwaReview(jsonData));

  viewTarget($('footer'), boardPk);
})

