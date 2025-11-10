<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
        
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include><!-- header.jsp -->
<style>
.info{
	text-align: center;
}
</style>
<body>
<div class="container">

   <p style="text-align:center"><button type="button" class="btn btn-secondary" onclick="location.href='/notice'">공지사항 목록</button></p>

		<form name="noticefrm" id="noticefrm" method="post" action="insert" enctype="multipart/form-data">
		<table class="table">
<%  
    if (session != null && session.getAttribute("s_email") != null && session.getAttribute("s_grade").equals("M")) {//관리자 등급이면
%>
		<tr>
		   <th class="info" style="text-align:center">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control" value="${notice.subject}"></td>
		</tr>
<% 
    }else{
%>
		<tr>
		   <th class="info" style="text-align:center">제목</th>
		   <td>${notice.subject}</td>
		</tr>
<%
    }//end 
%>
<%  
    if (session != null && session.getAttribute("s_email") != null && session.getAttribute("s_grade").equals("M")) {//관리자 등급이면
%>
		<tr>
		   <th class="info" style="text-align:center">작성자</th>
		   <td><input type="text" name="writer" id="writer" class="form-control"  value="${notice.writer}" maxlength="100"></td>
		</tr>
<% 
    }else{
%>
		<tr>
		   <th class="info" style="text-align:center">작성자</th>
		   <td>${notice.writer}</td>
		</tr>
<%
    }//end 
%>
<%  
    if (session != null && session.getAttribute("s_email") != null && session.getAttribute("s_grade").equals("M")) {//관리자 등급이면
%>
        <tr>
		   <th class="info">내용</th>
		   <td><textarea id="content" name="content" class="form-control">${notice.content}</textarea></td>
		</tr>
<% 
    }else{
%>
		<tr>
		   <th class="info">내용</th>
		   <td>${notice.content}</td>		  		    
		</tr>
<%
    }//end 
%>
		
		<tr>
		<td colspan="2" align="center">
			
<%  
    if (session != null && session.getAttribute("s_email") != null && session.getAttribute("s_grade").equals("M")) { //관리자 등급
%>
        <input type="hidden" name="noticeno" value="${notice.noticeno}">
        <input type="submit" value="수정" class="btn btn-primary" onclick="notice_update()">
        <input type="button" value="삭제" class="btn btn-danger" onclick="notice_delete()">
<%
    }
%> 	
		</td>
	    </tr>   
		</table>	
		</form>
	</div>
	
	
<script>

function notice_update(){
	document.noticefrm.action="/notice/update";
}// notice_update() end


function notice_delete(){
if(confirm("삭제하시겠습니까?")) {
	document.noticefrm.action="/notice/delete"; 
	document.noticefrm.submit();
}
}// notice_delete()


//
$('#content').summernote({
			height: 300,							
			minHeight: null,						
			maxHeight: null,						
			focus: true,							
			lang: "ko-KR",							
			placeholder: '내용을 작성해 주세요',	
			tabsize: 2,
			height: 120,
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['picture']],
				['view', ['fullscreen', 'help']] 
			]
		});
		
//
	
</script> 

<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>