import {getReviewsByBoardPk} from "./review-api.js";
import {viewTarget} from "../infinity_scroll.js";
import {drwaReview} from "../draw.js";

const boardPk = new URLSearchParams(location.search).get('seq');

console.log($('.bottom-menu-item a:nth-child(2)'))
// 모든 리뷰 보기
$(document).on('click', '.bottom-menu-item a:nth-child(2), #allReviewBtn', async (e) => {
  e.stopPropagation();
  $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
  const data = await getReviewsByBoardPk(boardPk);
  const jsonData = JSON.parse(data);
  console.log("jsonData", jsonData)
  $('.review-list').html(drwaReview(jsonData));

  viewTarget($('footer'), boardPk);
})

