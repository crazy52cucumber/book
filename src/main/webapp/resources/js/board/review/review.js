import {getReviewsByBoardPk} from "./review-api.js";
import {viewTarget} from "../infinity_scroll.js";
import {drwaReview} from "../draw.js";

const boardPk = new URLSearchParams(location.search).get('seq');

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
  if (jsonData.result === "0") {
    alert("한 번만 등록하실 수 있습니다.")
    return;
  }
  if (jsonData.result === "2") {
    alert("예약이 안된 고객이십니다.")
    return
  }
  location.href = `http://localhost:8080/board?seq=${boardPk}`
})

/* 리뷰 전송 후 변경
 if (jsonData.result == "1") {
    $('.modal-container').css('display', 'none');
    $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
    const data = await getReviewsByBoardPk(boardPk);
    const obj = JSON.parse(data);
    console.log('obj', obj);
    $('div strong').first().text(`${obj.length}개`)
    $('div.menu > p:first-child').text(`${obj.length}개`)
    $('.review-list').html(drwaReview(obj));
  }*/
