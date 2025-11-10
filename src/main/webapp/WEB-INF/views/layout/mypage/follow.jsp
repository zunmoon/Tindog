<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body class="wrapper">
	<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
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
<div class="cont">
		<div class="userInfoText">
			<div style="border-bottom: solid 1px darkgrey;">팔로우</div>
		</div>
		<div style="color: black;" class="userInfo">
			<div id="image_container mainPic_container">
				 <%-- <img src="storage/${item.userphoto}" alt="기본 이미지" id="userDefaultImg"  style="width: 50%" /> --%>
			</div>
			
			<form name="followfrm" id="followfrm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
				    <th colspan="4">팔로우 상대</th>
				</tr>
				<c:forEach var="item" items="${list}">
				<tr>
					<td style="text-align: left" colspan="2">
				    	${item.DNAME}
				    </td>
				    <td style="text-align: center;"><input class="btn-new" type="button" value="팔로우취소" onclick="followCancel('${item.EMAIL}')"></td>
				    <td style="text-align: center;"><input class="btn-new"  type="button" value="채팅하기" onclick="checkGum('${item.NICKNAME}')"></td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		
			</form>
		
	<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
	<script>var s_nickname = '<%=(String)session.getAttribute("s_nickname")%>'</script>
	<script>
	
	var confirmTx = function (message, callback, fallback) {
		  Swal.fire({
			title:"개껌이 1개 소모됩니다",
		    text: "진행할까요?",		    
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
	
		function checkGum(nickname) {
			$.ajax({
				url     : '/chatList/checkGum' // 요청 명령어
			  , type    : 'post'
			  , data    : {'s_nickname': s_nickname}
			  , success : function(result) {
				  // alert(result);
				  console.log(result);
				  if(result>=1) {
					  confirmTx('', function() {
						  startChat(nickname);
						}, function() {
							window.location.href = '/follow';
						});
				  } else {
					  Swal.fire({
				        	title:"개껌 부족",
				        	text:"개껌을 충전해주세요",
				        	icon:"error",
				        	confirmButtonText:"확인"
					  });
				  }
			  }
			  , error : function(error) {
				  alert("실패!");
				  alert(JSON.stringify(error));
				  console.log(JSON.stringify(error));
			  } 
			});
		}
	
		function startChat(nickname) {			
			$.ajax({
				url     : '/chatList/insert' // 요청 명령어
			  , type    : 'post'
			  , data    : {'nickname': nickname}
			  , success : function(result) {				 
				  console.log(result);
				  if(result==1) {
					  Swal.fire({
							title:"채팅방 개설 성공",							
							icon:"success",
							confirmButtonText:"확인"
					}).then(function(){					  
					  window.location.href = '/chatList';
					});
				  } else if(result==-1) {
					 
				  } else if(result==0) {
					   Swal.fire({
							title:"채팅방 개설 실패",
							text:"이미 개설된 채팅방이 있습니다",
							icon:"error",
							confirmButtonText:"확인"
					});					  
				  }
			  }
			  , error : function(error) {
				  alert("실패!");
				  alert(JSON.stringify(error));
				  console.log(JSON.stringify(error));
			  } 
			});
		}
	</script>
	<script>
	function followCancel(email) {
		$.ajax({
			url     : '/follow/delete/' + email // RESTfull방식으로 웹서비스 요청 예) /comment/delete/5
		  , type    : 'post'
		  , data    : {'email':email}
		  , success : function(result) {
					  	  if(result==1) {
					  		 Swal.fire({
									title:"팔로우 취소 성공",
									text:"팔로우 취소 되었습니다.",
									icon:"success",
									confirmButtonText:"확인"
							}).then(function(){
					  		  document.followfrm.action="/follow";
							  document.followfrm.submit();
							});
					  }else {
						  Swal.fire({
								title:"팔로우 취소 실패",
								text:"관리자에게 문의해주세요",
								icon:"error",
								confirmButtonText:"확인"
						});
					  }
			}
		});
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
