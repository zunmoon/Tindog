<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<c:forEach var="item" items="${list}">	
<div class="cont">
		
		<div class="userInfoText">
			<div style="border-bottom: solid 1px darkgrey;"> 신고하기</div>
		</div>
		<div style="color: black;" class="userInfo text-center">
			<form class="row g-3" name="reprotfrm" id="reportfrm">
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">Name</label>
		    <input type="text" value="${item.NICKNAME}" class="form-control" id="nickname" readonly>
		    <input type="hidden" value="${item.EMAIL}" id="reported" name="reported">
		  </div>
		   <div class="col-md-2">
		  </div>
		  <div class="col-md-6">
		  </div>
		  <div class="col-md-12">
		    <label for="inputEmail4" class="form-label">신고사유</label>
		    <input type="text" class="form-control" id="reportReason" name="reportReason">
		  </div>
		  <div class="col-md-10"></div>
		  <div class="col-md-2">
		  	<input type="button" class="form-control" id="report" value="신고하기" onclick="reportCheck()">
		  </div>
		</form>
			</div>
		</div>
		</c:forEach>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<script>
	function reportCheck() {
		let reason = $("#reportReason").val();
		let reported = $("#reported").val();
		
		if(reason.length == 0) {
			alert("사유를 입력해주세요");
		} else {
			$.ajax({
				url     : '/report2/insert'
			  , type    : 'post'
			  , data    : {'reported':reported
				          ,'reason'  :reason}
			  , error   : function(error) {
							  alert("신고가 접수되지 않았습니다");
							  alert(JSON.stringify(error));
							  console.log(JSON.stringify(error));
						  }
			  , success : function(result) {
				  			  if(result == 1) {
				  				  alert("신고가 접수되었습니다");
				  				  document.reprotfrm.action="/chatList";
								  document.reprotfrm.submit();
				  			  } else {
				  				  alert("신고 접수에 실패했습니다");
				  			  }
						  }
			});
		}
	}
</script>
</body>
</html>
    