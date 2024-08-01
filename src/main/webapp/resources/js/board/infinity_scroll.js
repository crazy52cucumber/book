// 무한 스크롤
import {getReviewsByBoardPkWithPaging} from "./review/review-api.js";
import {drwaReview} from "./draw.js";
import {closeModal, modal} from "./modal.js";

const paging = {
  startNum: 0,
  count: 0
}
let boardPk = 0;

const io = new IntersectionObserver(entries => {
  let reviewsByBoardPkWithPaging = '';
  let obj = '';
  entries.forEach(async entry => {
    if (entry.intersectionRatio > 0) {
      reviewsByBoardPkWithPaging = await getReviewsByBoardPkWithPaging(boardPk, paging);
      obj = JSON.parse(reviewsByBoardPkWithPaging);

      if (obj.data.length !== 0) $('.review-list').empty();

      $('.review-list').append(drwaReview(obj.data));
      paging.startNum += 5;
      paging.count = obj.count;
    }

    if (paging.count / paging.startNum < 1) {
      io.unobserve(entry.target)
    }

  })
  const reviewAEle = $('li a');
  const modalCancleBtnEle = $('#modalCancle');
  reviewAEle.each((idx, item) => {
    modal(item);

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
  boardPk = pk;
  io.observe(target[0]);
}