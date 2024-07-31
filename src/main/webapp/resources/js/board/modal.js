import {getReviewByReviewPk} from "./review/review-api.js";

const modalCancleBtnEle = $('#modalCancle');

export const drawModal = (item) => {
  $(item).on('click', e => {
    const reviewPk = item.childNodes[1].className.split('-')[2];
    getReviewByReviewPk(reviewPk);
    /*$('.modal-wrapper').addClass('active')
    $('.modal-container').css('display', 'block');*/
  });
}

export const closeModal = e => {
  e.stopPropagation();
  $('.modal-container').css('display', 'none');
  $('.modal-wrapper').removeClass('active')
  $('textarea').remove();
  $('#updateBtn').remove();
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

/*
*  const currUser = $('input[type="hidden"]').data('curruser');
    const writerPk = $(item).data('writer');
    $('.modal-wrapper').addClass('active')
    $('.modal-container').css('display', 'block');
    const textarea = $('<textarea></textarea>');
    const review = $(e.currentTarget).find('p').text().trim()
    const info = $(e.currentTarget).find('li')
    const writer = $(info[0]).text();
    const grade = $(info[1]).text();
    const date = $(info[2]).text();

    $('.modal-container--top > div:first-child > span:first-child').text(writer);
    $('.modal-container--top > div:first-child > span:last-child').text(grade);
    textarea.text(review);
    textarea.attr('readonly', 'readonly');

    if (currUser === writerPk) {
      const updateBtnEle = $('<button id="updateBtn" class="btn btn-primary">수정</button>')
      modalCancleBtnEle.after(updateBtnEle);
      $('#updateBtn').click(() => {
        textarea.removeAttr('readonly');
        textarea.focus();
        textarea[0].setSelectionRange(textarea.val().length, textarea.val().length);
      })
    }

    $('.modal-container--top > div:last-child').append(textarea);
    $('.modal-container--bottom > p').text(date);
* */