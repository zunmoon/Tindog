<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header-login.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<c:forEach var="item" items="${list}">	
<div class="cont">
		<div class="userInfoText">
			<div style="border-bottom: solid 1px darkgrey;"> 멍BTI 결과</div>
		</div>
		<div style="color: black;" class="userInfo text-center">
			<div class="cont">		
			${item.dbti}
			</div>	
		</div>			
</div>
</c:forEach>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    
    