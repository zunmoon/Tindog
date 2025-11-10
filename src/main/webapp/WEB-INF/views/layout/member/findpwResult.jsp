<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<style>
.found-success{
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
		<div class="found-success">
			<h4 style="display:inline-block;">임시 비밀번호 발급이 완료 되었습니다. </h4>
			<h4 style="display:inline-block;">이메일을 확인해서 로그인해주세요. </h4>
			<!-- 
			${email}
			<h4 style="display:inline-block;">입니다</h4>
			<br>
			<h4 style="display:inline-block;">회원님의 임시비밀번호는</h4>
			${password}
			<h4 style="display:inline-block;">입니다</h4>
			 -->
		</div>
		<div class="found-login">
			<input type="button" id="go" value="로그인" onClick="location.href='/login'"/>			
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>