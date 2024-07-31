import {addReview, SERVER_IP, updateReviewByReviewPk} from "./review-api.js";

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
  let method = $(e.target).text()
  let formData = new FormData();
  const title = $('#title').val().trim();
  const pros = $('#pros').html().trim();
  const cons = $('#cons').html().trim();
  const features = $('#features').html().trim();
  const wishes = $('#wishes').html().trim();
  const rate = $('#rate').val();
  const object = {};
  let data = '';
  formData.append("title", title);
  formData.append("pros", pros);
  formData.append("cons", cons);
  formData.append("features", features);
  formData.append("wishes", wishes);
  formData.append("rate", rate);

  formData.forEach(function (value, key) {
    object[key] = value;
  });

  if (method !== '수정') {
    data = await addReview(boardPk, object);
    let jsonData = JSON.parse(data);
    if (jsonData.result === "0") {
      alert("한 번만 등록하실 수 있습니다.")
      return;
    }
    if (jsonData.result === "2") {
      alert("예약이 안된 고객이십니다.")
      return
    }
    location.href = `${SERVER_IP}/board?seq=${boardPk}`
  } else {
    const reviewPk = location.href.substring(location.href.lastIndexOf("/") + 1);
    data = await updateReviewByReviewPk(reviewPk, object);
    let jsonData = JSON.parse(data);
    if (jsonData.result === "0") {
      alert("한 번만 등록하실 수 있습니다.")
      return;
    }
    if (jsonData.result === "2") {
      alert("예약이 안된 고객이십니다.")
      return
    }
    location.href = `${SERVER_IP}/board?seq=${localStorage.getItem('boardPk')}`
  }
})

// 수정 버튼 클릭
$('#updateBtn').click(e => {
  const reviewPk = $('.modal-container').attr('class').split(" ")[1];
  localStorage.setItem("boardPk", boardPk)
  location.href = `/reviews/update/${reviewPk}`;
})