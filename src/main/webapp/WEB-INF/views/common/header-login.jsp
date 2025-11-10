<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 wow fadeIn" data-wow-delay="0.1s">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">

            <img src="/img/tindog_logo.png" style="width: 180px;">
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav me-auto p-4 p-lg-0"> 
                <div class="nav-item dropdown">
  <%
	if(((String)session.getAttribute("s_grade")).equals("C") || ((String)session.getAttribute("s_grade")).equals("D")) {
%>                
					<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">중고마켓(활동정지)</a>
				</div>
<%
	}else {
%>
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">중고마켓</a>
                    <div class="dropdown-menu rounded-0 rounded-bottom m-0">
                        <a href="/write" class="dropdown-item">판매하기</a>
                        <a href="/list" class="dropdown-item">구매하기</a>
                        <a href="/layout/wishlist" class="dropdown-item">찜목록</a>
                    </div>
                </div>
<%
	}
%>                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">친구찾기</a>
                    <div class="dropdown-menu rounded-0 rounded-bottom m-0">
                        <a href="/worldcup" class="dropdown-item">이상형월드컵</a>
                        <a href="/dbti" class="dropdown-item">댕BTI 검사</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                	<a href="/notice" class="nav-link">공지사항</a>
                </div>    
<%
	if(((String)session.getAttribute("s_grade")).equals("M")) {
%>                                
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">관리자권한</a>
					<div class="dropdown-menu rounded-0 rounded-bottom m-0">
						<a href="/management" class="dropdown-item">회원등급 관리</a>
                		<a href="/reportList" class="dropdown-item">신고목록</a>
                		<a href="/dogtype" class="dropdown-item">견종추가</a>
                	</div>
                </div>
<%
	}
%>                              
            </div>
            <div style="padding-right: 50px;">
            <a href="/userInfo">My page |</a>
            <a href="/logOut">Logout</a>
            </div>
        </div>        
</nav>