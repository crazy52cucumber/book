<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class='academy-container'>
  <div class='academy-item'>
    <div class='content'>
      <div class='content-info'>
        <h3> ${info.dto.academyName} </h3>
        <p> ${info.dto.addr} </p>
      </div>
      <div class='content-img'>
        이미지??
      </div>
    </div>

    <div class='academy-score'>
      <div class='menu'>
        <p> ${info.avg} </p>
        <img src='${pageContext.request.contextPath}/resources/imgs/star.png'/>
      </div>
      <div class='menu'>
        <p> ${info.cnt} </p>
        <p> 리뷰수 </p>
      </div>
    </div>

    <a href='javascript:void(0)'>
      <button id="reviewButton" class='button review-btn'>리뷰 남기기</button>
    </a>
  </div>

  <div class='info-container'>
    <h5> 정보 </h5>
    <div class='info-item'>
      <div>
        <img src='${pageContext.request.contextPath}/resources/imgs/map.png'/>
        <p> 주소
      </div>
      <div>
        <p> ${info.dto.addr} </p>
      </div>
    </div>
    <div class='info-item'>
      <div>
        <img src='${pageContext.request.contextPath}/resources/imgs/addr.png'/>
        <p> 설립 </p>
      </div>
      <div>
        <p> ${info.dto.edate} </p>
      </div>
    </div>
    <div class='info-item'>
      <div>
        <img src='${pageContext.request.contextPath}/resources/imgs/school.png'/>
        <p> 학년 </p>
      </div>
      <div>
        <p> ${info.dto.grade} </p>
      </div>
    </div>
    <div class='info-item'>
      <div>
        <img src='${pageContext.request.contextPath}/resources/imgs/subject.png'/>
        <p> 과목 </p>
      </div>
      <div>
        <p> ${info.dto.subject} </p>
      </div>
    </div>

    <%--  content 추가--%>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto, autem consequuntur debitis error facere
      harum illum ipsam magnam maiores necessitatibus praesentium rem sed unde? Consequuntur ducimus ipsum iure officia
      sit?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto, autem consequuntur debitis error facere
      harum illum ipsam magnam maiores necessitatibus praesentium rem sed unde? Consequuntur ducimus ipsum iure officia
      sit?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto, autem consequuntur debitis error facere
      harum illum ipsam magnam maiores necessitatibus praesentium rem sed unde? Consequuntur ducimus ipsum iure officia
      sit?
    </div>

  </div>
</div>