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
<body class="wrapper">
	<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>

<div class="cont">
	<div class="userInfoText">
		<div style="border-bottom: solid 1px darkgrey;">채팅관리</div>
	</div>
	<div style="color: black;" class="userInfo">
		<div id="image_container mainPic_container">
				 <%-- <img src="storage/${item.userphoto}" alt="기본 이미지" id="userDefaultImg"  style="width: 50%" /> --%>
		</div>
			
		<form name=chatRoomfrm id="chatRoomfrm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
				    <th colspan="6">데이트 채팅목록</th>
				</tr>
				<c:forEach var="item" items="${list}">	
				<tr>
				    <td>${item.DNAME}</td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="채팅하기" onclick="location.href='chat/${item.DROOMNO}'"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="채팅방 나가기" onclick="chatRoomDelete(${item.DROOMNO})"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="신고하기" onclick="location.href='report/${item.NICKNAME}'"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="차단하기" onclick="cut(${item.DROOMNO}, '${item.NICKNAME}')"></td>				    	
						    	
				    <!-- <td style="text-align: center;"><input type="button" value="채팅하기" onclick="location.href='chat'"></td> -->
				</tr>
				</c:forEach>
			</table>
		</form>
		<form name="productchatRoomfrm" id="productchatRoomfrm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
				    <th colspan="6">중고마켓 채팅목록</th>
				</tr>
				<c:forEach var="item" items="${list2}">	
				<tr>
					<td style="text-align: left" colspan="2">
						<c:choose>
							<c:when test="${item.NICKNAME_TO == s_nickname}">
				    			${item.NICKNAME_FROM}
				    		</c:when>
				    		<c:when test="${item.NICKNAME_FROM == s_nickname}">
				    			${item.NICKNAME_TO}
				    		</c:when>
						</c:choose>
				    </td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="채팅하기" onclick="location.href='productchat/${item.PROOMNO}'"></td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="채팅방 나가기" onclick="productchatRoomDelete(${item.PROOMNO})"></td>
				    <td style="text-align: center;">
				    	<c:choose>
							<c:when test="${item.NICKNAME_TO == s_nickname}">
								<input type="button" class="btn-new" value="신고하기" onclick="location.href='report2/${item.NICKNAME_FROM}'">
				    		</c:when>
				    		<c:when test="${item.NICKNAME_FROM == s_nickname}">
				    			<input type="button" class="btn-new" value="신고하기" onclick="location.href='report2/${item.NICKNAME_TO}'">
				    		</c:when>
						</c:choose>
				    </td>
				    <td style="text-align: center;">
				    	<c:choose>
							<c:when test="${item.NICKNAME_TO == s_nickname}">
								<input type="button" class="btn-new" value="차단하기" onclick="cutP(${item.PROOMNO}, '${item.NICKNAME_FROM}')">
				    		</c:when>
				    		<c:when test="${item.NICKNAME_FROM == s_nickname}">
				    			<input type="button" class="btn-new" value="차단하기" onclick="cutP(${item.PROOMNO}, '${item.NICKNAME_TO}')">
				    		</c:when>
						</c:choose>
					</td>				    	

				    <!-- <td style="text-align: center;"><input type="button" value="채팅하기" onclick="location.href='chat'"></td> -->
				</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</div>
	<script>var s_nickname = '<%=(String)session.getAttribute("s_nickname")%>'</script>
	<script>
		function chatRoomDelete(droomno) {
			$.ajax({
				url     : '/chatList/delete/' + droomno // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
			  , type    : 'post'
			  , data    : {'droomno':droomno}
			  , success : function(result) {
						  	  if(result==1) {
						  		 Swal.fire({
							        	title:"채팅방 삭제 완료",
							        	text:"채팅방이 삭제되었습니다",
							        	icon:"success",
							        	confirmButtonText:"확인"	
							        }).then(function(){	
						  		  document.chatRoomfrm.action="/chatList";
								  document.chatRoomfrm.submit();
							      });
						  }else {
							  Swal.fire({
						        	title:"채팅방 삭제 실패",
						        	text:"관리자에게 문의하세요",
						        	icon:"error",
						        	confirmButtonText:"확인"	
						        });							 
						  }
				}
			});
		}
		
		function productchatRoomDelete(proomno) {
			$.ajax({
				url     : '/product_chatList/delete/' + proomno // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
			  , type    : 'post'
			  , data    : {'proomno':proomno}
			  , success : function(result) {
						  	  if(result==1) {
						  		Swal.fire({
						        	title:"채팅방 삭제 완료",
						        	text:"채팅방이 삭제되었습니다",
						        	icon:"success",
						        	confirmButtonText:"확인"	
						        }).then(function(){	
						  		  document.productchatRoomfrm.action="/chatList";
								  document.productchatRoomfrm.submit();
						  	});
						  }else {
							  Swal.fire({
						        	title:"채팅방 삭제 실패",
						        	text:"관리자에게 문의하세요",
						        	icon:"error",
						        	confirmButtonText:"확인"	
						        });		
						  }
				}
			});
		}
		
		function cut(droomno, nickname) {
			$.ajax({
				url     : '/chatList/cut/' + nickname // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
			  , type    : 'post'
			  , data    : {'nickname':nickname}
			  , success : function(result) {
						  	  if(result==1) {
						  		Swal.fire({
						        	title:"차단 완료",
						        	text:"채팅방도 자동 삭제됩니다",
						        	icon:"success",
						        	confirmButtonText:"확인"	
						        }).then(function(){
						  		  chatRoomDelete(droomno);
						        });
						  }else {
							  Swal.fire({
						        	title:"차단 실패",
						        	text:"관리자에게 문의하세요",
						        	icon:"error",
						        	confirmButtonText:"확인"	
						        });		
						  }
				}
			});
		}
		
		function cutP(proomno, nickname) {
			$.ajax({
				url     : '/chatList/cutP/' + nickname // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
			  , type    : 'post'
			  , data    : {'nickname':nickname}
			  , success : function(result) {
						  	  if(result==1) {
						  		Swal.fire({
						        	title:"차단 완료",
						        	text:"채팅방도 자동으로 삭제됩니다",
						        	icon:"success",
						        	confirmButtonText:"확인"	
						        }).then(function(){
						  		productchatRoomDelete(proomno);
						        });
						  }else {
							  Swal.fire({
						        	title:"차단 실패",
						        	text:"관리자에게 문의하세요",
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
