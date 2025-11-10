<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include> 
<body>
  

<div class="container"> 

	<div class="container">
	<table class="table">
	<thead>
		<tr align="center">		  
		    <th class="info">글번호</th>
			<th class="info">제목</th>
			<th class="info">작성자</th>
			<th class="info">작성일</th>
		  
		</tr>
	</thead>
	<tbody>
	<c:forEach var="notice" items="${list}" varStatus="no">
	<tr align="center">
	  <td>${notice.noticeno}</td>
	  <td><a href="notice/${notice.noticeno}">${notice.subject}</a></td>
	  <td>${notice.writer}</td>
	  <td>${notice.noticedate} </td>
 </tr>
	</c:forEach>
 	</table>
<%  
    if (session != null && session.getAttribute("s_email") != null && session.getAttribute("s_grade").equals("M")) {
%>
     <p style="text-align:right"><button type="button" class="btn btn-secondary" onclick="location.href='/notice/write'">공지사항 작성</button></p>   
<%
    }//end
%>
 	<c:if test="${requestScope.count > 0}">
		<c:set var="pagecnt" value="${requestScope.totalPage}"/>
		<c:set var="Pagestart" value="${requestScope.Pagestart}"/>
		<c:set var="Pageend"   value="${requestScope.Pageend}"/>
		
		<div class="content">
			
			<c:if test="${Pageend > pagecnt}">	
				<c:set var="Pageend" value="${pagecnt}"></c:set>
			</c:if>
			
			
			<c:if test="${Pagestart > 1}">
				<a href="./notice?pageNum=${Pagestart-1}">[이전]</a> 
			</c:if>
			
		
			<c:forEach var="i" begin="${Pagestart}" end="${Pageend}">
				<c:choose>
					<c:when test="${pageNum == i}"><span style="color: blue">${i}</span></c:when>
					<c:when test="${pageNum != i}"><a href="./notice?pageNum=${i}">[${i}]</a></c:when>
				</c:choose>
			</c:forEach>
			
			<c:if test="${Pageend < pagecnt}">
				<a href="./notice?pageNum=${Pageend+1}">[다음]</a>
			</c:if>
		</div>
	</c:if>  
		
    </div>
</div>


<div style="margin-top: 600px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>