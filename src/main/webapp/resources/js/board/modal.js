import {getReviewByReviewPk, updateReviewByReviewPk} from "./review/review-api.js";
import {drawContent} from "./draw.js";

const modalCancleBtnEle = $('#modalCancle');

export const modal = (item) => {
  $(item).click(async (e) => {
    const reviewPk = item.childNodes[1].className.split('-')[2];
    const data = await getReviewByReviewPk(reviewPk);
    const obj = JSON.parse(data);
    drawContent(obj);
  });
}

export const closeModal = e => {
  e.stopPropagation();
  $('.modal-container').css('display', 'none');
  $('.modal-wrapper').removeClass('active')
  $('textarea').remove();
}

// 모달 끄기 이벤트
$(document).click(e => {
  if ($(e.target).attr('class')?.startsWith('modal-wrapper')) closeModal(e)
});
modalCancleBtnEle.click(closeModal);

// 라벨 클릭 이벤트
$('label').on('click', (e) => {
  $(`#${$(e.currentTarget).attr('for')}`).focus();
});


