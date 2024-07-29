<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/modal.css">
<div class="modal-wrapper">
  <div class="modal-container">
    <div class="modal-container--top">
      <div>
        <span>작성자</span>
        <span>학년</span>
      </div>
      <%--content--%>
      <div></div>
    </div>
    <div class="modal-container--bottom">
      <p>날짜</p>
      <div>
        <button id="modalCancle" class="btn btn-danger">닫기</button>
      </div>
    </div>
  </div>
</div>
<input type="hidden" data-curruser="${member.member_seq}">