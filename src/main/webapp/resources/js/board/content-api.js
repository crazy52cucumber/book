export const SERVER_IP = 'http://localhost:8080';

// 댓글 달때 로그인 체크
export const checkCookie = async () => {
  const response = await $.get(`${SERVER_IP}/reviews/auth`)
  return response;
}

// 댓글 수정, 삭제할 때 작성자인지 확인
export const checkWriter = async (writerPk) => {
  const response = await $.get(`${SERVER_IP}/reviews/check/${writerPk}`)
  return response;
}

