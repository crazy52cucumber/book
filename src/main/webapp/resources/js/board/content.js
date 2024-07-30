import {drawModal} from "./modal.js";
import {addReview} from "./review/review-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');
// 유리

// 수완
const reviewAEle = $('li a');
reviewAEle.each((idx, item) => {
  drawModal(item);
});

$('#reviewButton').click(e => {
  alert("응애")
})