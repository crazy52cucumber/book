<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/main/test.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous"></script>
</head>
<body>
<main>
    <div class="ui-menu-divider"></div>
    <div class="main_wrap">
    <p class="search-count-academy">총 <strong>{count_academy}</strong> 개의 학원</p>

    <div class = "main-contents">
        <div class = "devider none-margin"></div>
        <ul class="ul">
            <c:forEach items="${list}" var="board">
                <li class="main-card">
                    <a href = "/board?seq=${board.board_seq}">
                    <div itemscope="itemscope" itemtype="https://schema.org/School" class="acdemy-item">
                        <div class="content">
                            <div class = "info">
                                <span itemprop="academy_name" class="h4-medium title">${board.academy_name}</span>
                                <span itemprop="addr" class="body2-medium address">${board.addr}</span>
                                <span itemprop="content" class="body2-medium2 tags">${board.content}</span>
                                <span itemprop="book_limit">${board.book_limit}</span>
                                <span itemprop="ldate" class="ldate">${board.ldate}</span>
                            </div>
                        </div>
                    </div>
                    <div class = "academy-item-menus">
                        <div class = "academy-menu">
                            <img src = "/resources/imgs/star.png"/>
                            <span itemprop="rate">${board.rate} 점</span>
                        </div>
                        <div class = "menu">
                            <p itemscope = "itemscope" class = "body3-medium menu-text">
                            <img src = "/resources/imgs/review.png"/>
                            <span itemprop="review_count">${board.review_count} 개</span>
                            </p>
                        </div>
                    </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</main>
</body>
</html>