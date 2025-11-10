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
<body>
<jsp:include page="/WEB-INF/views/common/header-login.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<div class="cont">
		<div class="dogInfoText">
			<div style="border-bottom: solid 2px darkgrey;">개껌페이</div>
		</div>
		

		
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    
    