<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 확인</title>
</head>
<body>
<div style="text-align: center">	
    <form method="post" action="/register/nickDupCheck" onclick="nickformcheck()">
    <div class="textForm">              
              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" autocomplete="off" required>              
              <div class="valid-feedback">
              
              </div>
              <div class="invalid-feedback">
                2글자 이상 10글자 이하로 작성해주세요. <br>특수문자, 공백은 불가능합니다
              </div>
    </div>   
    <button type="submit" class="btn-regi">중복확인</button>
    </form>
 </div>
    
    <script>
    function nickformcheck() {
		
    document.querySelector("#nickname").addEventListener("input", function(){
		let inputNick=this.value;
		if(inputNick.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[A-Za-z가-힣0-9]{2,10}$/
		
		if(regEx.test(inputNick)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.nickValid=true;
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.nickValid=false;
		}
	});    
    }
    </script>
    
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>