<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
.btn-new{
	box-shadow: 1px 1px 3px 1px #dadce0;
	background: white;
	border: 1px solid #C7DCFB;
	border-radius: 5px;
	color: #8D8E92;
	font-weight: 500;
	width: 50%;
	height: 40px;
	margin-right: 10px;
}

.btn-new:hover{
	cursor: pointer;
	background: #7fc7fe;
	color: white;
}
</style>
<body>
	
	<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>

<div class="cont">
	<div class="userInfoText">
		<div style="border-bottom: solid 1px darkgrey; width:200px;">차단 사용자 관리</div>
	</div>
	<div style="color: black;" class="userInfo">
		<div id="image_container mainPic_container">
				 <%-- <img src="storage/${item.userphoto}" alt="기본 이미지" id="userDefaultImg"  style="width: 50%" /> --%>
		</div>
			
		<form name="cutDogListfrm" id="cutDogListfrm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
				    <th colspan="6">차단 강아지 목록</th>
				</tr>
				<c:forEach var="item" items="${list}">	
				<tr>
				    <td>${item.DNAME}</td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="차단해제" onclick="cutCancel('${item.EMAIL}')"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="신고하기" onclick="location.href='report/${item.NICKNAME}'"></td>				    	    	
				    <!-- <td style="text-align: center;"><input type="button" value="채팅하기" onclick="location.href='chat'"></td> -->
				</tr>
				</c:forEach>
			</table>
		</form>
		<form name="productchatRoomfrm" id="productchatRoomfrm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
				    <th colspan="6">차단 유저 목록</th>
				</tr>
				<c:forEach var="item" items="${list2}">	
				<tr>
					<td>${item.NICKNAME}</td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="차단해제" onclick="cutCancel('${item.EMAIL}')"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="신고하기" onclick="location.href='report2/${item.NICKNAME}'"></td>				    	
						    	
				    <!-- <td style="text-align: center;"><input type="button" value="채팅하기" onclick="location.href='chat'"></td> -->
				</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</div>
	
	<script>var s_nickname = '<%=(String)session.getAttribute("s_nickname")%>'</script>
	<script>
		function cutCancel(email) {
			$.ajax({
				url     : '/cut/cancel/' + email // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
			  , type    : 'post'
			  , data    : {'email':email}
			  , success : function(result) {				  
						  	  if(result==1) {
						  		Swal.fire({
						        	title:"차단 해제 완료",
						        	text:"차단이 해제되었습니다",
						        	icon:"success",
						        	confirmButtonText:"확인"	
						        }).then(function(){
						  		  document.cutDogListfrm.action="/cut";
								  document.cutDogListfrm.submit();
								});
						  }else {
							  Swal.fire({
						        	title:"차단 해제 실패",
						        	text:"관리자에게 문의해주세요",
						        	icon:"error",
						        	confirmButtonText:"확인"
							  });
						  }
				}
			});
		}
	</script>
	<script src="/js/chat.js"></script>		
	<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
	<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>

</body>
</html>
