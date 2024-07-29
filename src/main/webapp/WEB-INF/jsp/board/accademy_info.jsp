<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class='academy-container'>
	<div class='academy-item'>
		<div class='content'>
			<div class='content-info'>
				<h3> 해법 수학 </h3>
				<p> 서울 강남구 대치동 989 태원 리치타운 상가 5,6층 </p>
			</div>
			<div class='content-img'>
				이미지??
			</div>
		</div>
		
		<div class='academy-score'>
			<div class='menu'>
				<p> 4.2 </p>
				<img src='${pageContext.request.contextPath}/resources/imgs/star.png'/>
			</div>
			<div class='menu'>
				<p> 450 </p>
				<p> 리뷰수 </p>
			</div>
		</div>
		
		<a href='#'>
			<button class='button' name='review_button' >리뷰 남기기</button>
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
				<p> 서울 강남구 대치동 989 태원 리치타운상가 5,6층 </p>
			</div>
		</div>
		<div class='info-item'>
			<div>
				<img src='${pageContext.request.contextPath}/resources/imgs/addr.png'/>
				<p> 설립 </p>
			</div>
			<div>
				<p> 2009년 (15년차) </p>
			</div>
		</div>
		<div class='info-item'>
			<div>
				<img src='${pageContext.request.contextPath}/resources/imgs/school.png'/>
				<p> 학년 </p>
			</div>
			<div>
				<p> 초등학교 1학년 - 6학년 </p>
			</div>
		</div>
		<div class='info-item'>
			<div>
				<img src='${pageContext.request.contextPath}/resources/imgs/subject.png'/>
				<p> 과목 </p>			
			</div>
			<div>
				<p> 영어 </p>			
			</div>
		</div>
	</div>
</div>