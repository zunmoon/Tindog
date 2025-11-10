<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<style>
.found-fail{
	position: relative;
	margin: auto;
	margin-top: 20px;
}

.found-login{
	position: relative;
	margin: auto;
}
#go{
	box-shadow: 1px 1px 3px 1px #dadce0;
	background: white;
	border: 1px solid #C7DCFB;
	border-radius: 5px;
	color: #8D8E92;
	font-weight: 500;
	width: 150px;
	height: 40px;
	margin-right: 10px;
	margin-top: 10px;
}

#go:hover{
	cursor: pointer;
	background: #C7DCFB;
	color: white;
}
</style>
<body class="wrapper">	
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
		<div class="found-fail">
			<h4>등록된 정보가 없습니다</h4>
		</div>
		<div class="found-login">
			<input type="button" id="go" value="다시 찾기" onClick="history.back()" /> 
			<input type="button" id="go" value="회원가입" onClick="location.href='/register'" />
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>