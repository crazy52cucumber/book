// 무한 스크롤
import {getReviewsByBoardPkWithPaging} from "./review/review-api.js";
import {drwaReview} from "./draw.js";

const paging = {
  startNum: 0,
  count   : 0
}
let boardPk = 0;

const io = new IntersectionObserver(entries => {
  console.log('paging', paging);
  let reviewsByBoardPkWithPaging = '';
  let jsonData = '';
  entries.forEach(async entry => {
    if (entry.intersectionRatio > 0) {
      do {
        reviewsByBoardPkWithPaging = await getReviewsByBoardPkWithPaging(boardPk, paging);
        jsonData = JSON.parse(reviewsByBoardPkWithPaging);

        $('.review-list').append(drwaReview(jsonData.data));
        console.log(jsonData)
        paging.startNum += 5;
        paging.count = jsonData.count;
      } while (paging.count / paging.startNum >= 1)

    }
  })
})

// 무한 스크롤 관찰 대상
export const viewTarget = (target, pk) => {
  $('.review-list').empty();
  boardPk = pk;
  target.each((idx, item) => {
    io.observe(item);
  })
}