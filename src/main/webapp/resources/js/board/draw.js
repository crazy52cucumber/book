export const drwaReview = (obj) => {
  console.log(obj)
  let html = '';
  for (let item of obj) {
    html += `<li>`
    html += `<a href="javascript:void(0)" data-writer="${item.memberSeq}">`
    html += `<div class="review-card-${item.reviewSeq}">`
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

export const drawContent = () => {

}