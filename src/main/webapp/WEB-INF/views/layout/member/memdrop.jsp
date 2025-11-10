<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include> 
<body>

<script>
if('${message}' == "2"){
	Swal.fire({
		title:"회원 탈퇴 실패",
		text:"비밀번호를 확인해주세요",
		icon:"error",
		confirmButtonText:"확인"
});
}


if('${message}' == "1"){
	Swal.fire({
		title:"회원 탈퇴 성공",
		text:"",
		icon:"success",
		confirmButtonText:"확인"
});
}

function dropCheck(){ 
	
	let password=document.getElementById("password").value;
	if(password.length==0){
		Swal.fire({
			title:"",
			text:"비밀번호를 입력해주세요",
			icon:"error",
			confirmButtonText:"확인"
		}).then(function(){
		document.getElementById("password").focus;
		});
		return false;
	}//if end
		
}//dropCheck() end



</script>  

<div class="container"> 
    
    <h4><p style="text-align:center">[회원탈퇴]</p></h4>
    
    <form name="dropfrm" id="dropfrm" method="post" action="memdropend" enctype="multipart/form-data" onsubmit="return dropCheck()">
    <input type="hidden" name="email" id="email" value="${s_email}"> 
    	
    <div></div>
	<table class="table">
	<tr>
	<th class="info" style="text-align:center">회원탈퇴 유의사항</th>
	 <td class="form-control">
	 <li>*유의사항을 확인한 후 탈퇴를 진행하여 주시기 바랍니다.</li>
	 <li>*회원 탈퇴 시 회원 전용 웹 서비스 이용이 불가합니다.</li>
	<li>*서비스 탈퇴 후에는 TINDOG에 작성한 게시글 수정 및 삭제가 불가합니다.</li>
	<li>*탈퇴를 위해 비밀번호를 재입력해주시기 바랍니다.</li>		
    </td>
	</tr>
	<tr>
	<th class="info" style="text-align:center">이메일</th>
	<td><input type="email" name="email" id="email" class="form-control" value="${s_email}"></td> 
	</tr>
	<tr>
	<th class="info" style="text-align:center">비밀번호</th>
	<td><input type="password" name="password" id="password" class="form-control"></td>
	</tr>
	<tr>
	   <td colspan="2" align="center">
		  <input type="button"  value="이전페이지" class="btn btn-secondary" onclick="location.href='/userInfo'">
		  <input type="submit" value="탈퇴하기" class="btn btn-secondary">
		       
	   </td> 
	</tr>  
	</table>
	</form> 
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>


