<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
  
    if (session != null && session.getAttribute("s_email") != null) {
        // 세션이 올라와있으면 header-login.jsp include
        request.getRequestDispatcher("/WEB-INF/views/common/header-login.jsp").include(request, response);
    } else {
        // 세션이 올라와있지 않으면 header.jsp include
        request.getRequestDispatcher("/WEB-INF/views/common/header.jsp").include(request, response);
    }
%>

