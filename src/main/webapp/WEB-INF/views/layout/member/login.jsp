<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div id="login">
 
 	 <div id="login-title">
   		 <p class="logintitle">로그인 또는 회원가입</p>
   		 <hr>
  	</div>
  
	<form id="myForm" name="myForm" method="post" action="/loginResult">
  	<div id="login-body">
    	<h3 style="text-align: center;">틴독에 오신 것을 환영합니다.</h3>
    	<input type="text" name="email" id="email" class="email-login-body"  placeholder="이메일">
    	<input type="password" id="password" name="password"  class="password-login-body" placeholder="비밀번호">    	
    	<input type="button" class="btn-regi" id="checkBtn-login-body" value="계속" onclick="sendIt()">
    	<input type="submit" class="btn-regi" id="loginBtn-login-body" value="로그인" onclick="location.href='loginResult'">
  	</div>
	</form>
	<label><input type="checkbox" value="SAVE" name="c_id" id="c_id">ID저장</label>
			    <div id="regFindBtn">
			    <a href="/register">회원가입</a>
			    &nbsp;&nbsp;&nbsp;
			    <a href="/findIdpw">아이디/비밀번호찾기</a> 
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

<script>
$(function(){
	fn_login();
	fn_displayRememberId();
});

function fn_login() {
	$('#myForm').submit(function(event){ 
		
		if($('#email').val() == '' || $('#password').val() == '') {
			event.preventDefault();
			return; // 아래 if문 막으려고 한거임
		}
	
		if($('#c_id').is(':checked')) {
			$.cookie('c_id', $('#email').val());
		} else {
			$.cookie('c_id', '');
		}									
	});
}

function fn_displayRememberId() {
	let c_id = $.cookie('c_id');
	if(c_id == '') {
		$('#email').val('');
		$('#c_id').prop('checked', false);
	} else {
		$('#email').val(c_id);
		$('#c_id').prop('checked', true);
	}
	
}
</script>
<div style="margin-top: 500px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>