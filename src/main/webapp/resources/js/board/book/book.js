const boardPk = new URLSearchParams(location.search).get('seq');
$('form[name="bookForm"]').submit(async (e) => {
    e.preventDefault()
    const aa = document.getElementById('member')
    if (aa.value === '') {
        alert('강남땃쥐와 함께 하시면 이용할 수 있는 서비스입니다 :)')
        location.href = '/member/member.do?method=login';
        return;
    }
    const btn = ($(e.target).children()[1])
    const formEle = $('form[name="bookForm"]');
    let result = 0;
    console.log($(btn).text())
    if ($(btn).text().trim() === '예약취소') {
        if (!confirm("예약취소 하시겠습니까?")) return;
    } else {
        if (!confirm("예약 하시겠습니까?")) return;
    }
    formEle.attr('action', `/book/${boardPk}`);
    result = await $.get(formEle.attr('action'));
    const obj = JSON.parse(result)
    console.log(obj)
    if (obj.result === '1') {
        location.href = `/board?seq=${boardPk}`
    }
})