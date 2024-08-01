<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8"/>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>--%>
<%--    <title>Document</title>--%>
<%--    <link rel="stylesheet" href="/resources/css/main/list.css">--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="--%>
<%--            crossorigin="anonymous"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<main>--%>
<%--    <div class="main-container">--%>
<%--        <p class="search-count-academy">총 <strong>${count}</strong> 개의 학원</p>--%>
<%--        <div class = "main-contents">--%>
<%--            <c:forEach items="${list}" var="board">--%>
<%--                <a href = "/board?seq=${board.board_seq}">--%>
<%--                    <div class="main-card">--%>
<%--                        <h4 itemprop="academy_name" class="academy-item-name">${board.academy_name}</h4>--%>
<%--                        <ul class="main-ul">--%>
<%--                            <li itemprop="content" class="academy-item-content">${board.content}</li>--%>
<%--                            <li itemprop="addr" class="academy-item-address">${board.addr}</li>--%>
<%--                            <li itemprop="ldate" class="academy-item-ldate">강의일 : ${board.ldate}</li>--%>
<%--                            <li itemprop="book_limit" class="academy-item-limit">예약 가능 인원 : ${board.book_limit}명</li>--%>
<%--                        </ul>--%>
<%--                        <div class = "academy-item-menus">--%>
<%--                            <div class = "academy-rate">--%>
<%--                                <img src = "/resources/imgs/star.png" class = "academy-rate-img"/>--%>
<%--                                <span itemprop="rate">${board.rate} 점</span>--%>
<%--                            </div>--%>
<%--                            <div class = "academy-review">--%>
<%--                                <img src = "/resources/imgs/review.png" class = "academy-count-img"/>--%>
<%--                                <span itemprop="review_count">${board.review_count} 개</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>
<%--</body>--%>
<%--</html>--%>