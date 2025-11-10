<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 확인</title>
</head>
<body>
<div style="text-align: center">	
    <form method="post" action="" onclick="emailformcheck()">
    <div class="textForm">            
            <input type="text" class="form-control" name="email" id="email" placeholder="name@example.com" autocomplete="off" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
    <input type="submit" class="btn-regi" value="중복확인">
    </form>
    </div>
    
    <script>
    function emailformcheck() {	
	
    document.querySelector("#email").addEventListener("input", function(){
		let inputEmail=this.value;
		if(inputEmail.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/
		
		if(regEx.test(inputEmail)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.emailValid=true;			
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.emailValid=false;			
		}
	});	
    }
    </script>
    
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>