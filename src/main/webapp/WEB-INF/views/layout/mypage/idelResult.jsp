<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
#winnerInfo{
	position: relative;
	top: 50px;	
}
</style>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
	<div class="cont">
	<div class="userInfoText">
		<div style="border-bottom: solid 1px darkgrey; width:220px;">이상형 월드컵 결과</div>
	</div>
		<c:forEach var="item" items="${list}">
			<div id="winnerInfo" style="margin-left: 150px;">
				<div style="width:400px; height:200px">
					<img src="/img/${item.MAINPHOTO}" class="img-fluid rounded-start"
						alt="..." style="width:400px; height:300px">

					<h5 class="card-title" style="text-align: center;">${item.DNAME}(${item.AGE})</h5>
					<table style="width: 400px">
						<tr>
							<th><img width="24" height="24"
								src="https://img.icons8.com/material/24/female.png" alt="female" /></th>
							<td>${item.SEX eq 'f' ? '여' : '남'}/ 중성화${item.NEUTRAL}</td>
						</tr>
						<tr>
							<th><img width="24" height="24"
								src="https://img.icons8.com/material-rounded/24/dog.png"
								alt="dog" /></th>
							<td><c:choose>
									<c:when test="${item.SIZE eq 1}">
			                    소형견
			                </c:when>
									<c:when test="${item.SIZE eq 2}">
			                    중형견
			                </c:when>
									<c:when test="${item.SIZE eq 3}">
			                    대형견
			                </c:when>
									<c:otherwise>
			                    기타 크기
			                </c:otherwise>
								</c:choose> / ${item.WEIGHT} kg</td>
						</tr>
						<tr>
							<th><img width="24" height="24"
								src="https://img.icons8.com/material/24/sheet-of-paper.png"
								alt="sheet-of-paper" /></th>
							<td><div>${item.DOG_DETAIL}</div></td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>	
	</div>
	
	<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    