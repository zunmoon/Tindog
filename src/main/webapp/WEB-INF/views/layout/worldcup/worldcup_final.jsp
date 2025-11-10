<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<style>

th{

text-align: right;
width: 25%;

}
td{
text-align: left;

}

#winnerInfo{

display: flex;
justify-content: center;

}

table{

margin-bottom: 20px;

}

.card-title{

margin-top: 20px;

}

</style>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

 <!-- 1라운드 -->
 <c:forEach var="item" items="${list}">	
	<div id="img-round16-container">
		 <img id="img-round16" src="/img/Winner.png">
	</div>
	
<div id="winnerInfo" class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 50px;" >
	<div class="card" style="width: 25rem;">


      <img src="/img/${item.MAINPHOTO}" class="img-fluid rounded-start" alt="...">

        <h5 class="card-title">${item.DNAME} (${item.AGE})</h5>
       <table style="width:400px">
			<tr>
				<th><img width="24" height="24" src="https://img.icons8.com/material/24/female.png" alt="female"/></th>
				<td>${item.SEX eq 'f' ? '여' : '남'} / 중성화${item.NEUTRAL}</td>
			</tr>
			<tr>
				<th><img width="24" height="24" src="https://img.icons8.com/material-rounded/24/dog.png" alt="dog"/></th>
				<td> <c:choose>
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
			            </c:choose>
			            / ${item.WEIGHT} kg</td>
			</tr>
			<tr>
				<th><img width="24" height="24" src="https://img.icons8.com/material/24/sheet-of-paper.png" alt="sheet-of-paper"/></th>
				<td><div>${item.DOG_DETAIL}</div></td>
			</tr>
		</table>
	

	</div>
</div>


	<form style="text-align: center;" action="followInsert" method="post">
		<input type="hidden" name="email" value="${item.EMAIL}"></input>
		<button type="submit" style="width:300px; left: 150px;" class="btn-regi">팔로우 하기</button>
	</form>
</c:forEach>       
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>