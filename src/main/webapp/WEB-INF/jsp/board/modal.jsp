<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/modal.css">
<div class="modal-wrapper">
  <div class="modal-container">
    <div class="modal-container--top">
      <div>
        <div class="writer-info">
          <span>작성자</span>
          <span>학년</span>
        </div>
        <div class="rate">
          <select name="rate" id="rate">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
          <span class="star"></span>
        </div>
      </div>

      <div class="input-container">
        <div><h4><input type="text" value="제목"></h4></div>
        <div>
          <label for="pros"><strong>좋은점</strong></label>
          <div contenteditable="true" id="pros" name="pros"/>
        </div>
        <div>
          <label for="cons"><strong>아쉬운점</strong></label>
          <div contenteditable="true" id="cons" name="cons"/>
        </div>
        <div>
          <label for="feature"><strong>수업방식 및 특징</strong></label>
          <div contenteditable="true" id="feature" name="feature"/>
        </div>
        <div>
          <label for="wishes"><strong>학원에 바라는점</strong></label>
          <div contenteditable="true" id="wishes" name="wishes"/>
        </div>

      </div>
    </div>
  </div>
  <div class="modal-container--bottom">
    <p>날짜</p>
    <div>
      <button id="modalCancle" class="btn btn-danger">닫기</button>
    </div>
  </div>
</div>
</div>