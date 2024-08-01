export const SERVER_IP = 'http://localhost:8080';

// 리뷰 달때 로그인 체크
export const checkCookie = async () => {
  const response = await $.get(`${SERVER_IP}/reviews/auth`)
  return response;
}

// 리뷰 수정, 삭제할 때 작성자인지 확인
export const checkWriter = async (writerPk) => {
  const response = await $.get(`${SERVER_IP}/reviews/check/${writerPk}`)
  return response;
}

// 리뷰 작성시 수강일이 지났는지 확인 / 세션으로 확인
export const checkValid = async (boardPk) => {
  const response = await $.get(`${SERVER_IP}/reviews/valid/${boardPk}`)
  return response;
}