<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class='academy-container'>
    <div class='academy-item'>
        <div class='item-content'>
            <div class='content-info'>
                <h3> ${info.dto.academyName} </h3>
                <p> ${info.dto.addr} </p>
            </div>
            <div class='content-img'>
                <img class='hb-img' src='${pageContext.request.contextPath}/resources/imgs/hb.jpg'/>
            </div>
        </div>

        <div class='academy-score'>
            <div class='menu'>
                <div class="menu-wrapper">
                    <p> ${info.avg} </p>
                    <img src='${pageContext.request.contextPath}/resources/imgs/star.png'/>
                </div>
            </div>
            <div class='menu'>
                <p> ${info.cnt} </p>
                <img src='${pageContext.request.contextPath}/resources/imgs/review.png'/>
            </div>
        </div>

        <a href='javascript:void(0)'>
            <button id="reviewButton" class='button review-btn'>리뷰 남기기</button>
        </a>
    </div>

    <div class='info-container'>
        <h5> 정보 </h5>
        <div class='info-item'>
            <div class='info-wrapper'>
                <img src='${pageContext.request.contextPath}/resources/imgs/map.png'/>
                <p> 주소
            </div>
            <div class='info-wrapper'>
                <p> ${info.dto.addr} </p>
            </div>
        </div>
        <div class='info-item'>
            <div class='info-wrapper'>
                <img src='${pageContext.request.contextPath}/resources/imgs/addr.png'/>
                <p> 설립 </p>
            </div>
            <div class='info-wrapper'>
                <p> ${info.dto.edate} </p>
            </div>
        </div>
        <div class='info-item'>
            <div class='info-wrapper'>
                <img src='${pageContext.request.contextPath}/resources/imgs/school.png'/>
                <p> 학년 </p>
            </div>
            <div class='info-wrapper'>
                <p> ${info.dto.grade} </p>
            </div>
        </div>
        <div class='info-item'>
            <div class='info-wrapper'>
                <img src='${pageContext.request.contextPath}/resources/imgs/subject.png'/>
                <p> 과목 </p>
            </div>
            <div class='info-wrapper'>
                <p> ${info.dto.subject} </p>
            </div>
        </div>
        <div class='info-item'>
            <div class='info-wrapper'>
                <img src='${pageContext.request.contextPath}/resources/imgs/date.png'/>
                <p> 강의일
            </div>
            <div class='info-wrapper'>
                <p> ${info.dto.ldate}</p>
            </div>
        </div>

        <%--  content 추가--%>
        <div class='academy-content'>
            <h5> 강의소개 </h5>
            <div class='content'>
                ${info.dto.content}
            </div>
        </div>
    </div>
</div>