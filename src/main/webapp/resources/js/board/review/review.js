import {getReviewsByBoardPk, getReviewsByBoardPkWithPaging} from "./review-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');
const paging = {
  startNum: 0,
  count   : 0
}

// 모든 리뷰 보기
$('#allReviewBtn').click(async () => {
  $('footer').addClass('review-active')
  $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
  const data = await getReviewsByBoardPk(boardPk);
  const jsonData = JSON.parse(data);
  $('.review-list').html(drwaReview(jsonData));


// 무한 스크롤
  const io = new IntersectionObserver(entries => {
    entries.forEach(async entry => {
      if (entry.intersectionRatio > 0) {
        if (paging.count / paging.startNum >= 1) {
          let reviewsByBoardPkWithPaging = await getReviewsByBoardPkWithPaging(boardPk, paging);
          let jsonData = JSON.parse(reviewsByBoardPkWithPaging);

          $('.review-list').append(drwaReview(jsonData.data));
          paging.count = jsonData.count;
          console.log("paging", paging)
          console.log(jsonData);
        }
      }
    })
  })

// 무한 스크롤 관찰 대상
  const reviewListEle = $('.review-active')
  reviewListEle.each((idx, item) => {
    io.observe(item);
  })
})

const drwaReview = (jsonData) => {
  paging.startNum += 5;
  paging.count = jsonData.length;
  let html = '';
  for (let item of jsonData) {
    html += `<li>`
    html += `<a href="javascript:void(0)">`
    html += `<div class="review-card">`
    html += `<div class="review-card--header">`
    html += `<div>`
    html += `<img src="/resources/imgs/별.png" alt="">`
    html += `<span class="rate">${item.rate}</span>`
    html += `</div>`
    html += `<div>정성리뷰</div>`
    html += `</div>`
    html += `<p class="review-card--content">`
    html += `<span class="title">${item.title}</span>`
    html += `</p>`
    html += `<ul class="review-card--info">`
    html += `<li><span class="nickname">${item.nickname}</span></li>`
    html += `<li><span class="grade">${item.grade}</span></li>`
    html += `<li><span class="cdate">${item.cdate}</span></li>`
    html += `</ul>`
    html += `</div>`
    html += `</a>`
    html += `</li>`
  }
  return html;
}

