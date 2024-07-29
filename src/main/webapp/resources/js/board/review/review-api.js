export const getReviewsByBoardPk = async (boardPk) => {
  const response = await $.get(`http://localhost:8080/reviews/all/${boardPk}`)
  return response;
}

export const getReviewsByBoardPkWithPaging = async (boardPk, paging) => {
  const response = await $.ajax(`http://localhost:8080/reviews/all/${boardPk}`, {
    contentType: 'application/json',
    type       : 'POST',
    data       : JSON.stringify(paging),
  })
  return response;
}