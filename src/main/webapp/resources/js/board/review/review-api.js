export const getReviewsByBoardPk = async (boardPk) => {
  const response = await $.get(`http://localhost:8080/reviews/all/${boardPk}`)
  return response;
}