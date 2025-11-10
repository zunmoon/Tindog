<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<%
    if (session != null && session.getAttribute("s_email") != null) {
        // 세션이 올라와있으면 header-login.jsp include
        request.getRequestDispatcher("/WEB-INF/views/common/header-login.jsp").include(request, response);
    } else {
        // 세션이 올라와있지 않으면 header.jsp include
        request.getRequestDispatcher("/WEB-INF/views/common/header.jsp").include(request, response);
%>    
    <script>
        // 세션 값이 없을 때 JavaScript로 alert 창 띄우기
            Swal.fire({
        	title:"로그인 후 이용해주세요",
        	text:"",
        	icon:"warning",        	
        	confirmButtonText: "확인"  	        	
        })
        .then(function() {
        	window.location.href = "/login"; // 다른 페이지로 이동
		});                 
    </script>
        
<% 
    }
%>

