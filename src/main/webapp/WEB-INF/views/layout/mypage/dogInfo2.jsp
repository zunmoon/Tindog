<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table, tbody, tr, td{
	border: 2px solid #fff; 
	color : black;

}


</style>
<!DOCTYPE html>
<html>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<div class="cont">
		<div class="dogInfoText">
			<div style="border-bottom: solid 2px darkgrey;">강아지 정보</div>
		</div>
		
		<div style="color: black;" class="dogInfo">
<c:forEach var="item" items="${list}">	
<div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card">
      <img src="storage/${item.mainphoto}" id="dog1" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${item.dname} (${item.age})</h5>
        <p class="card-text"></p>
      </div>
    </div>
  </div>
  <!-- 
  <div class="col">
    <div class="card">
      <img src="img/dog2.jpeg" id="dog2" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">둥둥이 (2) </h5>
        <p class="card-text"></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="img/dog1.jpeg" id="dog3" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">둥둥이 (2) </h5>
        <p class="card-text"></p>
      </div>
    </div>
  </div>
   -->
</div>
			
		</div>
	</div>
	
	<!--모달시작-->
	<div id="dogInfoModal" class="dog1Modal">
		<div id="modal-content">
			<span class="modal-close">&times;</span>
			<div id="dog_detail">
				
				<!--캐로셀 이미지 시작-->
				<div id="carouselBox">
					<div id="carouselExampleIndicators" class="carousel slide carousel-slide">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
								aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
								aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
								aria-label="Slide 3"></button>
						</div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img src="storage/${item.pic1}" id="carousel-img" class="d-block w-100" alt="">
							    </div>
							    <div class="carousel-item">
							      <img src="storage/${item.pic2}" id="carousel-img" class="d-block w-100 " alt="">
							    </div>
							    <div class="carousel-item">
							      <img src="storage/${item.pic3}" id="carousel-img" class="d-block w-100 " alt="">
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
						</div>
				</div>
				<!-- 캐로셀 이미지 끝 -->
				
				<!--<div id="dogDetailImg">
					<img src="img/dog2.jpeg" alt="기본 이미지" id="dog1DetailImg"/>-->
					<div id="dog1detail">
						<div class="form-check form-switch" id="worldcup-switch">
							<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
							<label class="form-check-label" for="flexSwitchCheckDefault"> 월드컵 후보</label>
						</div>
					<span class="name-age">${item.dname} (${item.age})</span>
						<div id="dog1detail-content">
						
						<table style="width:120px">
							<tr>
								<th><img width="24" height="24" src="https://img.icons8.com/material/24/female.png" alt="female"/></th>
								<td>${item.sex eq 'f' ? '여' : '남'} / 중성화${item.neutral}</td>
							</tr>
							<tr>
								<th><img width="24" height="24" src="https://img.icons8.com/material-rounded/24/dog.png" alt="dog"/></th>
								<td> <c:choose>
							                <c:when test="${item.size eq 1}">
							                    소형견
							                </c:when>
							                <c:when test="${item.size eq 2}">
							                    중형견
							                </c:when>
							                <c:when test="${item.size eq 3}">
							                    대형견
							                </c:when>
							                <c:otherwise>
							                    기타 크기
							                </c:otherwise>
							            </c:choose>
							            / ${item.weight} kg</td>
							</tr>
							<tr>
								<th><img width="24" height="24" src="https://img.icons8.com/material/24/sheet-of-paper.png" alt="sheet-of-paper"/></th>
								<td>${item.dog_detail}</td>
							</tr>
						</table>						
						</div>
					</div>
			</div>
		</div>
	</div>
	</c:forEach>	
	<!-- 모달 끝 -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    
    