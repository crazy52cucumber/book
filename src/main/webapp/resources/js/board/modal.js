import {addReview, getReviewsByBoardPk} from "./review/review-api.js";
import {drwaReview} from "./draw.js";
import {viewTarget} from "./infinity_scroll.js";

const boardPk = new URLSearchParams(location.search).get('seq');
const modalCancleBtnEle = $('#modalCancle');

export const drawModal = (item) => {
  $(item).on('click', e => {

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

// 별점 추가 이벤트
$('#rate').change(e => {
  const starEle = $('.star')
  let rate = $(e.target).val()
  let imgHtml = '';

  for (let i = 0; i < rate; i++) {
    imgHtml += `<img src="/resources/imgs/별.png" alt="별">`
  }
  starEle.empty().append(imgHtml);
})

// 전송
$('#submitBtn').click(async (e) => {
  let formData = new FormData();
  const title = $('#title').val().trim();
  const pros = $('#pros').html().trim();
  const cons = $('#cons').html().trim();
  const features = $('#features').html().trim();
  const wishes = $('#wishes').html().trim();
  const rate = $('#rate').val();
  formData.append("title", title);
  formData.append("pros", pros);
  formData.append("cons", cons);
  formData.append("features", features);
  formData.append("wishes", wishes);
  formData.append("rate", rate);

  const object = {};
  formData.forEach(function (value, key) {
    object[key] = value;
  });
  const data = await addReview(boardPk, object);
  const jsonData = JSON.parse(data);
  if (jsonData.result === "0")
    alert("한 번만 등록하실 수 있습니다.")

  if (jsonData.result === "2")
    alert("예약이 안된 고객이십니다.")

  if (jsonData.result == "1") {
    $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
    const data = await getReviewsByBoardPk(boardPk);
    const obj = JSON.parse(data);
    console.log('성공후? ', obj)
    $('.review-list').html(drwaReview(obj));

    viewTarget($('footer'), boardPk);
  }
})


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