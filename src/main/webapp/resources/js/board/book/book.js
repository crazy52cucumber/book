const boardPk = new URLSearchParams(location.search).get('seq');
$('form[name="hi"]').submit(async (e) => {
    e.preventDefault()
    const formEle = $('form[name="hi"]');
    let result = 0;
    if (confirm('예약 할까요?')) {
        formEle.attr('action', `/book/${boardPk}`);
        result = await $.get(formEle.attr('action'));
    }
    const obj = JSON.parse(result)
    if (obj.result === '1') {
        location.href = `/board?seq=${boardPk}`
    }
})


/*
$("#bookBtn").on("click", function () {
    //로그인 여부 확인
    //강의 날짜 확인
    if (confirm('예약 할까요?') === true) {
        console.log('hihihi');

    } else {
        return false;
    }
})*/
