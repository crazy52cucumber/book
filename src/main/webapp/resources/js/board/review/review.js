import {addReview, SERVER_IP, updateReviewByReviewPk} from "./review-api.js";
import {checkCookie, checkWriter} from "../content-api.js";

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
      alert("한번만 작성하실 수 있습니다.")
      return;
    }
    location.href = `${SERVER_IP}/board?seq=${boardPk}`
  } else {
    const reviewPk = location.href.substring(location.href.lastIndexOf("/") + 1);
    data = await updateReviewByReviewPk(boardPk, reviewPk, object);
    let jsonData = JSON.parse(data);
    if (jsonData.result === "0") {
      alert("수정이 안됐습니다.")
      return;
    }
    //location.href = `${SERVER_IP}/board?seq=${localStorage.getItem('boardPk')}`
  }
})

// 수정 버튼 클릭
$('#updateBtn').click(async (e) => {
  const reviewPk = $('.modal-container').attr('class').split(" ")[1];
  localStorage.setItem("boardPk", boardPk)

  const flag = await isLogin();
  if (!flag) {
    alert("로그인 후 이용 가능합니다.")
    return;
  }

  // 동일인인지 검증
  const writerPk = document.querySelector('.writer-info').dataset.writer;
  const data = await checkWriter(writerPk);
  const obj = JSON.parse(data);
  if (obj.result === '1')
    location.href = `/reviews/update/${reviewPk}`;
  else alert('작성자가 아닙니다.')
})

// 삭제 버튼 클릭
$('#deleteBtn').click(async e => {
  const reviewPk = location.href.substring(location.href.lastIndexOf("/") + 1);
  const response = await $.get(`${SERVER_IP}/reviews/remove/${reviewPk}`);
  const obj = JSON.parse(response);
  if (obj.result === '1')
    location.href = `${SERVER_IP}/board?seq=${localStorage.getItem('boardPk')}`
  else history.go(-1);
})

const isLogin = async () => {
  const data = await checkCookie();
  const obj = JSON.parse(data);
  if (obj.result === '0') return false;
  else return true;
}