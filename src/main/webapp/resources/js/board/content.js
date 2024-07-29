import {drawModal} from "./modal.js";
import {SERVER_IP} from "./content-api.js";

const boardPk = new URLSearchParams(location.search).get('seq');
// 유리

// 수완
const reviewAEle = $('li a');
reviewAEle.each((idx, item) => {
  drawModal(item);
});

// 예약창
$('#bookBtn').click(() => {
  $.ajax(`${SERVER_IP}/book/${boardPk}`, {})
})