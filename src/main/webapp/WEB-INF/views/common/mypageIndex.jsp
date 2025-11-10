<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
#nickname-gum{
	display: flex;
    justify-content: center;
    position: relative;
    right: 50px;

}
.mypage-gumqty {
    display: flex;
    align-items: center;
}


nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul li {
	font-size: 20px;
	font-family: sans-serif;
	background-color: white;
	border: 1px solid black;
	letter-spacing: 0.1em;
	width: 9em;
	height: 1.5em;
	line-height: 1.5em;
	position: relative;
	overflow: hidden;
	margin: 0.5em;
	cursor: pointer;
	font-style: italic;
}

nav ul li span {
	color: white;
	mix-blend-mode: difference;
}

nav ul li::before {
	content: '';
	position: absolute;
	width: 9em;
	height: inherit;
	background-color: black;
	border-radius: 50%;
	top: 0;
	left: -10em;
	transition: 1s ease-out;
}

nav ul li:hover::before {
	transform: scale(7);
}

.avatar{
		background:#fff;
		text-align:center;
		

		
		p{
			font-weight: 300;
    		font-size: x-large;
		}
		.user-img{
		width:40px;
		height:40px;
		align-self: center;
		position: relative;
    	bottom: 6px;
		}
		
		.gum-img{
			width:20px;
			height:20px;
			align-self: center;
		}
	
	}



		.btn-new-pay{
			box-shadow: 1px 1px 3px 1px #dadce0;
			background: white;
			border: 1px solid #C7DCFB;
			border-radius: 5px;
			color: #8D8E92;
			font-weight: 500;
			width: 80%;
			height: 37px;
			margin-right: 10px;
		}

		.btn-new-pay:hover{
			cursor: pointer;
			background: #7fc7fe;
			color: white;
		}


</style>
<body class="wrapper">

<jsp:include page="/WEB-INF/views/common/header-login.jsp"></jsp:include>
<%String nickname = (String) session.getAttribute("s_nickname");
int gumqty = (int) session.getAttribute("s_gumqty");
 

%>
<div class="mypage">
  <header class="avatar">
            <div id="nickname-gum">
            <img class="user-img" width="64" height="64" src="https://img.icons8.com/cotton/64/user-male-circle.png" alt="user-male-circle"/>     
            <p class="nickname"><%= nickname %></p>
            <span class="mypage-gumqty">(<img class="gum-img" width="26" height="26" src="https://img.icons8.com/metro/26/000000/dog-bone.png" alt="dog-bone"/> <%= gumqty %>)</span>
            </div>
  </header>
		<nav>
		  <ul>
<%
	if(((String)session.getAttribute("s_grade")).equals("M")) {
%>
			<li><a href="/management"><span>회원등급 관리</span></a></li>	
			<li><a href="/reportList"><span>신고목록</span></a></li>
		    <li><a href="/dogtype"><span>견종추가</span></a></li>
<%
	}
%>
		    
<%
	if(((String)session.getAttribute("s_grade")).equals("B")) {
%>
			<li><a href="/userInfo"><span>MY INFO</span></a></li>
		    <li><a href="/dogInfo"><span>DOGGY INFO</span></a></li>
		    <li><a href="#"><span id="payBtn" class="open-pay-popup">개껌페이충전</span></a></li>
			<li><a href="/chatList"><span>채팅</span></a></li>
		    <li><a href="/cut"><span>차단목록</span></a></li>
		    <li><a href="/notice"><span>공지사항</span></a></li>
		    <li><a href="/memdrop#"><span>회원탈퇴</span></a></li>
			
<%
	}else if(((String)session.getAttribute("s_grade")).equals("C")) {
%>
			<li><a href="/userInfo"><span>MY INFO</span></a></li>
		    <li><a href="/dogInfo"><span>DOGGY INFO</span></a></li>
		    <li><a href="#"><span id="payBtn" class="open-pay-popup">개껌페이충전</span></a></li>
	    	<li><a href="/follow"><span>팔로우</span></a></li>
	    	<li><a href="/chatList"><span>채팅</span></a></li>
		    <li><a href="/cut"><span>차단목록</span></a></li>
		    <li><a href="/idelResult"><span id="btn">이상형 월드컵 결과</span></a><br></li>
		    <li><a href="/notice"><span>공지사항</span></a></li>
		    <li><a href="/memdrop"><span>회원탈퇴</span></a></li>
<%
	}else if(((String)session.getAttribute("s_grade")).equals("D")) { 
%>
			<li><a href="/userInfo"><span>MY INFO</span></a></li>
		    <li><a href="/dogInfo"><span>DOGGY INFO</span></a></li>
		    <li><a href="#"><span id="payBtn" class="open-pay-popup">개껌페이충전</span></a></li>
		    <li><a href="/notice"><span>공지사항</span></a></li>
		    <li><a href="/memdrop"><span>회원탈퇴</span></a></li>
<%
	}else if(((String)session.getAttribute("s_grade")).equals("A")){
%>		  
			<li><a href="/userInfo"><span>MY INFO</span></a></li>
		    <li><a href="/dogInfo"><span>DOGGY INFO</span></a></li>
		    <li><a href="#"><span id="payBtn" class="open-pay-popup">개껌페이충전</span></a></li>
			<li><a href="/follow"><span>팔로우</span></a></li>
	    	<li><a href="/chatList"><span>채팅</span></a></li>
		    <li><a href="/cut"><span>차단목록</span></a></li>
		    <li><a href="/idelResult"><span id="btn">이상형 월드컵 결과</span></a><br></li>
		    <li><a href="/notice"><span>공지사항</span></a></li>
		    <li><a href="/memdrop"><span>회원탈퇴</span></a></li>
<%
	}
%>      
		  </ul>
		</nav>
    </div>
	
	<!--개껌페이 모달 시작 -->
	<div class="pay-modal" id="pay-modal">
		   		<div class="pay-modal-body">
				
					<div id="pay-table"> <!-- 개껌페이 시작 -->
						<table class="table table-borderless">
						  <tbody>
						    <tr>
						      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 1개</th>
						      <td>1000원</td>
						      <td><button type="button" class="btn-new-pay" onclick="requestPay('1', '1','${email}')">결제</button></td>
						    </tr>
						    <tr>
						      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 11개</th>
						      <td>10000원</td>
						      <td><button type="button" class="btn-new-pay" onclick="requestPay('11', '1','${email}')">결제</button></td>
						    </tr>
						    <tr>
						      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 35개</th>
						      <td>30000원</td>
						      <td><button type="button" class="btn-new-pay" onclick="requestPay('35', '1','${email}')">결제</button></td>
						    </tr>
						  </tbody>
						</table>
					</div> <!-- 개껌페이 끝  -->
					
				<span class="pay-close" id="close-pay-btn"> X </span>   
			</div>
			</div>
	
	<!--개껌페이 모달 끝 -->
	
	<!-- 모달 끝 -->
	
	
</body>
<!--결제 관련 -->
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>