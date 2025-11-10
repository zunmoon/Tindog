<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div id="login">
 
 	 <div id="login-title">
   		 <p class="logintitle">로그인 또는 회원가입</p>
   		 <hr>
  	</div>
  
	<form id="myForm" name="myForm" method="post" action="/loginResult">
  	<div id="login-body">
    	<h3>틴독에 오신 것을 환영합니다.</h3>
    	<input type="text" name="email" id="email" class="email-login-body"  placeholder="이메일" style="margin-bottom:0px;" onclick="hideMessage()">
    	<span style="color:red; font-size:13px;" id="message">로그인 정보를 다시 확인 해 주세요</span>
    	<input type="password" id="password" name="password"  class="password-login-body" placeholder="비밀번호">
    	<br>
    	<input type="button" id="checkBtn-login-body" value="계속" onclick="sendIt()">
    	<input type="submit" id="loginBtn-login-body" value="로그인" onclick="location.href='loginResult'">
  	</div>
	</form>
	
	<label><input type="checkbox" value="SAVE" name="c_id">ID저장</label>
			    <div id="regFindBtn">
			    <a href="/register">회원가입</a>
			    &nbsp;&nbsp;&nbsp;
			    <a href="#">아이디/비밀번호찾기</a> 
				</div>

  <div id="login-else">
    <hr id="bar">
    <span id="txt">또는</span>
    <hr id="bar">
  </div>

  <div id="login-loginbtn">
    <!-- Kakao 로그인 버튼 노출-->
    <div id="login-kakao"> 
    <a id="kakao-login-btn" href="/oauth2/authorization/kakao" >
        <img src="/img/kakao.jpeg" width="40px" height="40px"  alt="카카오 로그인 버튼" />
    </a>
    </div>
    <div id="login-kakao-txt">
      <p class="sociallogin">카카오 로그인</p>
    </div> 

  <!-- 네이버 로그인 버튼 노출 영역 -->
    <div id="login-naver">
    <a href="/oauth2/authorization/naver">
		<img src="/img/naver.png" width="40px" height="40px"  alt="네이버 로그인 버튼" />
	</a>
    </div>
    <div id="login-naver-txt">
      <p class="sociallogin">네이버 로그인</p>
    </div> 
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

<script>

		function hideMessage() {
		    var message = document.getElementById("message");
		    message.style.display = "none"; // span 요소를 숨김
		    
		    var input = document.getElementById("email");
	        input.style.marginBottom = "10px"; // input 요소의 marginBottom을 10px로 설정
		}
	

</script>
</html>