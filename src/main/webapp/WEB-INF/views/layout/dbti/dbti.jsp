<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/js/dbti.js"></script>
    <link href="/css/dbti.css" rel="stylesheet"> 
   	<link href="/css/dbtiContent.css" rel="stylesheet">
  </head>
  <body class="wrapper">
<jsp:include page="/WEB-INF/views/common/sessionHeaderAlert.jsp"></jsp:include>
    <div class="dbti_container">
	
      <div class="intro_container content_container">
      	<div class="dbti_main">
      		<img src="/img/dbti.png" class="dog">
	        <div class="dbti_name">
	        	강아지 MBTI
	        </div>
	        <div class="start">
	        <button class="startbtn" type="button" data-action="start">시작하기</button>
	        </div>
	    </div>
      </div>

      <div class="test_container content_container">
        <h2>
          <span class="progress point_text"></span>
          <span class="question"></span>
        </h2>
        <div class="answer_container">
          <button class="answer" id=opt1 type="button" data-answer="a"></button>
          <button class="answer" id=opt2 type="button" data-answer="b"></button>
        </div>
      </div>
<form id="dbtiForm" method="post" action="dbtiinsert">
		<input type="hidden" id="data" name="data" value="">
      <div class="result_container content_container">
        <h2 class="result_text"></h2>        
        <button class="save" type="submit">저장하기</button>        
        <button class="restart" type="button" data-action="restart">다시하기</button>
        <button class="home" type="button" onclick="location.href='/'">홈으로</button>
      </div>
</form>
    </div>

    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
    <script>
      const dbti = new Dbti('.dbti_container');
    </script>
  </body>
</html>