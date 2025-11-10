<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<div class="cont">
		
		<div class="userInfoText">
			<div style="border-bottom: solid 1px darkgrey; width: 270px;">견종추가하기(관리자용)</div>
		</div>
		<div style="color: black;" class="userInfo text-center">
			<form class="row g-3" name="reprotfrm" id="reportfrm">
		  <div class="col-md-4">
		  </div>
		   <div class="col-md-2">
		  </div>
		  <div class="col-md-6">
		  </div>
		  <div class="col-md-8">
		    <label for="inputEmail4" class="form-label">견종</label>
		    <input type="text" class="form-control" id="dogtype" name="dogtype">
		  </div>
		  <div class="col-md-6"></div>
		  <div class="col-md-2">
		  	<input type="button" class="form-control" id="insertDogtype" value="등록하기" onclick="insert()">
		  </div>
		</form>
			</div>
		</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<script>
	function insert() {
		// alert();
		let dogtype = $("#dogtype").val();
		
		if(dogtype.length == 0) {
				  Swal.fire({
			        	title:"견종을 입력해주세요",			        	
			        	icon:"error",
			        	confirmButtonText:"확인"
				  });					  
		} else {
			$.ajax({
				url     : '/dogtype/insert'
			  , type    : 'post'
			  , data    : {'dogtype':dogtype}
			  , error   : function(error) {
							  Swal.fire({
						        	title:"견종이 등록되지 않았습니다",			        	
						        	icon:"error",
						        	confirmButtonText:"확인"
							  });							  
							  alert(JSON.stringify(error));
							  console.log(JSON.stringify(error));
						  }
			  , success : function(result) {
				  			  if(result == 1) {
					  				Swal.fire({
							        	title:"새로운 견종이 등록되었습니다.",			        	
							        	icon:"success",
							        	confirmButtonText:"확인"
								  	});				  				  
				  			  } else if(result == -1){
					  				Swal.fire({
							        	title:"이미 등록된 견종입니다",			        	
							        	icon:"error",
							        	confirmButtonText:"확인"
								  	});				  				  
				  			  } else {
				  				  alert("견종 등록에 실패했습니다")
				  			  }
				  			  $("dogtype").val('');  
						  }
			});
		} 
	}		
</script>
</body>
</html>
    