<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div id="winnerInfo" class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 50px;" >
	<div class="card" style="width: 20rem; height: 500px; margin-left:150px;">


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

        <h5 class="card-title">${item.dname} (${item.age}) / ${item.dbti}</h5>
       <table id="dog-info-table">
			<tr>
				<th><img width="24" height="24" src="https://img.icons8.com/material/24/female.png" alt="female"/></th>
				<td style="text-align: left;">${item.sex eq 'f' ? '여' : '남'} / 중성화${item.neutral}</td>
			</tr>
			<tr>
				<th><img width="24" height="24" src="https://img.icons8.com/material-rounded/24/dog.png" alt="dog"/></th>
				<td style="text-align: left;"> <c:choose>
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
				<td style="text-align: left;"><div>${item.dog_detail}</div></td>
			</tr>
		</table>
	

	</div>
</div>
</div>
</div>
	
	</c:forEach>	

<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    
    