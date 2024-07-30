export const SERVER_IP = 'http://localhost:8080';

export const getReviewsByBoardPk = async (boardPk) => {
  const response = await $.get(`${SERVER_IP}/reviews/all/${boardPk}`)
  return response;
}

export const getReviewsByBoardPkWithPaging = async (boardPk, paging) => {
  const response = await $.ajax(`${SERVER_IP}/reviews/all/${boardPk}`, {
    contentType: 'application/json',
    type       : 'POST',
    data       : JSON.stringify(paging),
  })
  return response;
}

export const addReview = async (boardPk, data) => {
  const response = await $.ajax(`${SERVER_IP}/reviews/add/${boardPk}`, {
    contentType: 'application/json',
    type       : 'POST'
  })
  return response;
}