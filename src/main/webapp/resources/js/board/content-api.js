export const SERVER_IP = 'http://localhost:8080';

export const checkCookie = async () => {
  const response = await $.get(`${SERVER_IP}/reviews/auth`)
  return response;
}