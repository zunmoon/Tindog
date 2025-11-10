<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script>
Swal.fire({
	title:"검색 결과가 없습니다",
	text:"옵션에 해당하는 강아지가 없습니다",
	icon:"error",
	confirmButtonText:"확인"
}).then(function(){					  
	  window.location.href = '/worldcup';
});
</script>
</body>
</html>