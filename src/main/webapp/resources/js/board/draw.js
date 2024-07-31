export const drwaReview = (obj) => {
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

export const drawContent = (obj) => {
  let imgHtml = '';
  $('.modal-wrapper').addClass('active')
  $('.modal-container').css('display', 'block');
  $('.modal-container').removeClass().addClass(`modal-container ${obj.reviewSeq}`);
  $('.writer-info span:first-child').text(obj.nickname);
  $('.writer-info span:last-child').text(obj.grade);
  $('.writer-info')[0].dataset.writer = obj.memberSeq;
  $('#title').val(obj.title);
  $('#pros').html(obj.pros);
  $('#cons').html(obj.cons);
  $('#features').html(obj.features);
  $('#wishes').html(obj.wishes);
  $('#date').text(obj.cdate);

  for (let i = 0; i < obj.rate; i++) {
    imgHtml += `<img src="/resources/imgs/별.png" alt="별">`
  }
  $('.rate').empty().append(imgHtml);
}