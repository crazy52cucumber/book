import {getReviewsByBoardPk} from "./review-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');

// 모든 리뷰 보기
$('#allReviewBtn').click(async () => {
  $('.review-conainer').load('http://localhost:8080/async_page/review_page.jsp')
  const data = await getReviewsByBoardPk(boardPk);
  const jsonData= JSON.parse(data);
  drwaReview(jsonData);



})

const drwaReview=(jsonData)=>{
  const reviewListEle = $('.review-list');
  let html = '';
  for (let item of jsonData) {
    html+=`<li>`
   html+=`<a href="javascript:void(0)">`
   html += `<div class="review-card">`
   html+= `<div class="review-card--header">`
   html +=`<div>`
   html +=`<img src="/resources/imgs/별.png" alt="">`
   html +=`<span class="rate">${item.rate}</span>`
   html+=`</div>`
   html+=`<div>정성리뷰</div>`
    html+=`</div>`
   html+=`<p class="review-card--content">`
   html +=`<span class="title">${item.title}</span>`
   html+=`</p>`
   html+=`<ul class="review-card--info">`
   html+=`<li><span class="nickname">${item.nickname}</span></li>`
   html+=`<li><span class="grade">${item.grade}</span></li>`
   html+=`<li><span class="cdate">${item.cdate}</span></li>`
   html+=`</ul>`
   html+=`</div>`
   html+=`</a>`
    html+=`</li>`
  }
  reviewListEle.html(html);
}