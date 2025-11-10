<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="find">
<div class="idfind">
<form name="idfindscreen" method = "POST">
	<section class = "form-search">
		<div>
			<h5>아이디 찾기</h5>
		</div>
		<div class = "find-name">			
			<input type="text" class="form-control" name="member_name" class="" placeholder="이름">
			<br>			
		</div>
		<div class = "find-phone">			
			<input type="text" class="form-control" name="member_phone" class="" placeholder="핸드폰 번호">			
		</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" id="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="reset" id="reset" value="취소" onClick="history.back()">
 	</div>
 </form>
 </div>
 <div class="pwfind">
 <form name="pwfindscreen" method = "POST">			
		<section class = "form-search">
			<div>
				<h5>비밀번호 찾기</h5>
			</div>
			<div class = "find-name">				
				<input type="text" class="form-control" name="member_name" class="" placeholder="이름">
			<br>
			</div>
		
		 <div class = "find-email">				
				<input type="text" class="form-control" name="member_email" class="" placeholder="이메일">
			</div> 
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" id="enter" value="찾기"  onClick="pw_search()">
		<input type="button" name="cancle" id="reset" value="취소" onClick="history.back()">
 	</div>
 </form>
 </div>
 </div>
<script>
function id_search() { 
 	var frm = document.idfindscreen;

 	if (frm.member_name.value.length < 1) {
 		Swal.fire({
        	text:"이름을 제대로 작성했는지 확인해주세요",        	
        	icon:"error",
        	confirmButtonText:"확인"
	  });
	  return;
	 }
 	
 	if (frm.member_phone.value.length < 1) {
 		Swal.fire({
        	text:"핸드폰 번호를 제대로 작성했는지 확인해주세요",        	
        	icon:"error",
        	confirmButtonText:"확인"
	  });
	  return;
	 }

 frm.action = "/findidResult";
 frm.submit();  
 }
 
function pw_search(){

	  var frm=document.pwfindscreen;

	  if (frm.member_name.value.length < 1) {
	 		Swal.fire({
	        	text:"이름을 제대로 작성했는지 확인해주세요",        	
	        	icon:"error",
	        	confirmButtonText:"확인"
		  });
		  return;
	  }

	  if (frm.member_email.value.length < 1) {
		  Swal.fire({
	        	text:"이메일을 제대로 작성했는지 확인해주세요",        	
	        	icon:"error",
	        	confirmButtonText:"확인"
		  });
		  return;
	 }

	  frm.action="/findpwResult"; 
	  frm.submit(); 
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>