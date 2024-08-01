<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(function () {
      $("#success-outlined").on("click", function () {
        $.ajax({
          url     : "member.do?m=myBookingList",
          type    : "GET",
          data    : {so: $("#success-outlined").val()},
          datatype: 'json',
          success : function (data) {
            console.log(data)
            let html = "";
            html += "";
            if (data.length() == 0) {
              html += "<div>데이터가 없음</div>";
            } else {
              for (const board of data) {
                html += "<a href = " + "http://localhost:8080/board?seq=" + board.board_seq + "/>";
                html += "<div>" + board.board_seq + "</div>";
                html += "<div>" + board.academy_name + "</div>";
                html += "<div>" + board.addr + "</div>";
                html += "<div>" + board.phone_num + "</div>";
                html += "<div>" + board.content + "</div>";
              }
            }
          },
          error   : function (data) {

          }
        });
      });
    });
  </script>

  <style>

      * {
          box-sizing: border-box;
      }

      main {
          max-width: 500px;
          width: 100%;
      }

      main > div {
          margin-top: 150px;
      }

      section {
          border: 1px solid violet;
          height: 175px;
      }

      a {
          text-decoration: none;
      }

      @media screen and (min-width: 501px) {
          main {
              margin: 0 auto;
          }
      }

      @media screen and (max-width: 500px) {
          main {
              margin: 0;
          }
      }


      .main-container {
          background-color: lightblue;
      }

      .search-count-academy {
          font-weight: bolder;
      }

      .main-contents {
          margin-top: 1px;
      }

      .main-card {
          background-color: white;
      }

      .academy-item-name {
          font-weight: bold;
          padding: 10px;
      }

      .main-ul {
          list-style-type: none;
          background-color: antiquewhite;
          display: flex;
          flex-direction: column;
      }

      .academy-item-content {
          font-size: 20px;
          font-weight: bold;
          padding-bottom: 1px;
      }

      .academy-item-address {
          font-size: 12px;
      }

      .academy-item-ldate {
          font-size: 12px;
          flex-direction: row;
      }

      .academy-item-limit {
          font-size: 12px;
          flex-direction: row;
      }

      .academy-item-menus {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
          height: 50px;
      }

      .academy-rate-img {
          height: 20px;
          width: 20px;
      }

      .academy-count-img {
          height: 20px;
          width: 20px;
      }


  </style>
  <script>
    $(function () {
      $("#success-outlined").on("click", function () {
        $.ajax({
          url     : "member.do?method=reserved1",
          type    : "GET",
          dataType: "json",

          success: function (data) {
            let html = "";
            data.forEach(item => {
              html += "<a href='#'>";
              html += "<div class='main-card'>";
              html += "<h4>data.academy_name</h4>";
              html += "<ul class='main - ul'>";
              html += "<li itemprop='content' class='academy-item-content'>data.content</li>";
              html += "<li itemprop='addr' class='academy-item-address'>data.addr</li>";
              html += "<li itemprop='ldate' class='academy-item-ldate'>강의일 : data.lDate</li>";
              html += "<li itemprop='book_limit' class='academy-item-limit'>예약가능 인원 : data.book_limit</li>";
              html += "</ul>";
              html += "<div class='academy_item-menus'>";
              html += "<div class='academy-rate'>";
              html += "<img src='/resources/imgs/star.png' class='academy-rate-img'/>";
              html += "<span itemprop='rate'>0점/span>";
              html += "</div>";
              html += "<div class='academy-review'>";
              html += "<img src='/resources/imgs/review.png' class='academy-count-img'/>";
              html += "<span itemprop='review_count'>0 개</span>";
              html += "</div>";
              html += "</div>";
              html += "</div>";
              html += "</a>";
            });
            $("#result-container").html(html);

          },
          error  :

              function (data) {
                alert("예약된 강의가 없습니다");
              }
        })
      })
      $("#danger-outlined").on("click", function () {
        $.ajax({
          url    : "member.do?method=reserved2",
          type   : "GET",
          success: function (data) {

          },
          error  : function (data) {
            alert("예약된 강의가 없습니다");
          }
        })
      })
    })
  </script>
</head>
<body>
<div id="container">
  <div id="main-container">
    <div id="btns">
      <input
              type="radio"
              class="btn-check"
              name="options-outlined"
              id="success-outlined"
              autocomplete="off"
              checked=""
      />
      <label class="btn btn-outline-success" for="success-outlined">
        예약중
      </label>

      <input
              type="radio"
              class="btn-check"
              name="options-outlined"
              id="danger-outlined"
              autocomplete="off"
      />
      <label class="btn btn-outline-danger" for="danger-outlined">
        수강완료
      </label>
    </div>

    <div class="main-container">
      <p class="count-book">총 <strong>n</strong>개의 예약</p>
      <div class="main-contents"></div>
      <c:if test="${empty myBookingList}">
        <div class="main-card">예약한 강의가 없습니다</div>
      </c:if>
      <c:forEach items="${myBookingList}" var="board">
        <div id="result-container"></div>
        ${board.board_seq}
        <a href="http://localhost:8080/board?seq=${board.board_seq}" class="">
          <div class="main-card">
            <h4>${board.academy_name}</h4>
            <ul class="main-ul">
              <li itemprop="content" class="academy-item-content">${board.content}</li>
              <li itemprop="addr" class="academy-item-address">${board.addr}</li>
              <li itemprop="ldate" class="academy-item-ldate">강의일 : ${board.lDate}</li>
              <li itemprop="book_limit" class="academy-item-limit">예약가능 인원 : ${board.book_limit}</li>
            </ul>
            <div class="academy_item-menus">
              <div class="academy-rate">
                <img src="/resources/imgs/star.png" class="academy-rate-img"/>
                <span itemprop="rate">0점</span>
              </div>
              <div class="academy-review">
                <img src="/resources/imgs/review.png" class="academy-count-img"/>
                <span itemprop="review_count">0 개</span>
              </div>
            </div>
          </div>
        </a>
      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>