// 무한 스크롤
import {getReviewsByBoardPkWithPaging} from "./review/review-api.js";
import {drwaReview} from "./draw.js";
import {closeModal, drawModal} from "./modal.js";

const paging = {
  startNum: 0,
  count   : 0
}
let boardPk = 0;

const io = new IntersectionObserver(entries => {
  let reviewsByBoardPkWithPaging = '';
  let jsonData = '';
  entries.forEach(async entry => {
    if (entry.intersectionRatio > 0) {
      paging.startNum += 5;
      paging.count = jsonData.count;
      reviewsByBoardPkWithPaging = await getReviewsByBoardPkWithPaging(boardPk, paging);
      jsonData = JSON.parse(reviewsByBoardPkWithPaging);
      $('.review-list').append(drwaReview(jsonData.data));
    }
  })
  const reviewAEle = $('li a');
  const modalCancleBtnEle = $('#modalCancle');
  reviewAEle.each((idx, item) => {
    drawModal(item);

    $(document).click(e => {
      if ($(e.target).attr('class')?.startsWith('modal-wrapper')) {
        closeModal(e)
      }
    });
    modalCancleBtnEle.click(closeModal);
  });
})

// 무한 스크롤 관찰 대상
export const viewTarget = (target, pk) => {
  $('.review-list').empty();
  boardPk = pk;
  target.each((idx, item) => {
    io.observe(item);
  })
}