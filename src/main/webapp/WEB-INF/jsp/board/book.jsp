<%@ page contentType="text/html;charset=UTF-8" language="java" import="book.util.BookConst" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<body>
<div class="book-container">
    <form name='hi' action="book/book.do" method="get">
        <c:choose>
            <c:when test="${book.bookCnt == book.totalBookLimit}">
                <button id="fullyBtn" class="btn btn-warning " disabled> 예약마감</button>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${statusBook == BookConst.LOGIN_NO || statusBook == BookConst.BOOk_NO}">
                        <button id="bookBtn" class="btn btn-warning"> 예약하기
                            (${book.bookCnt}/${book.totalBookLimit})
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button id="cancelBtn" class="btn btn-warning " disabled> 예약취소</button>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </form>
</div>
</body>