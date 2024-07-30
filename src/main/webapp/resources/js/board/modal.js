const modalCancleBtnEle = $('#modalCancle');

export const drawModal = (item) => {
  $(item).on('click', e => {

  });
}

export const closeModal = e => {
  $('.modal-container').css('display', 'none');
  $('.modal-wrapper').removeClass('active')
  $('textarea').remove();
  $('#updateBtn').remove();
}

$(document).click(e => {
  if ($(e.target).attr('class')?.startsWith('modal-wrapper')) closeModal(e)
});
modalCancleBtnEle.click(closeModal);

$('label').on('click', (e) => {
  $(`#${$(e.currentTarget).attr('for')}`).focus();
});

$('#rate').change(e => {
  const starEle = $('.star')
  let rate = $(e.target).val()
  let imgHtml = '';

  for (let i = 0; i < rate; i++) {
    imgHtml += `<img src="/resources/imgs/별.png" alt="별">`
  }
  starEle.empty().append(imgHtml);
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