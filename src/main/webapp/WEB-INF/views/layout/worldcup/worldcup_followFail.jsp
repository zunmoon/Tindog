<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

 <!-- 1라운드 -->


<script>


var confirmEx = function (message, callback, fallback) {
	  Swal.fire({
		title:"팔로우 성공",
	    text: "친구목록으로 이동하시겠습니까?",
	    icon:"success",
	    confirmButtonText:"확인",
	    cancelButtonText:"취소",
	    showCancelButton: true,
	    allowOutsideClick: false,
	  }).then(function (result) {
	    if (result.isConfirmed) {
	      if (callback) { callback(); }
	    } else if (result.isDismissed) {
	      if (fallback) { fallback(); }
	    }
	  });
	};
	
	confirmEx('팔로우 완료되었습니다', function() {
			window.location.href = '/follow';
		}, function() {
			window.location.href = '/worldcup';
		});

</script>




</body>
</html>