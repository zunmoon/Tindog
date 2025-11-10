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


<body>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

<div class="container"> 


   <p style="text-align:center">[공지사항 작성]</p>
   <p style="text-align:center"><button type="button" class="btn btn-secondary" onclick="location.href='/notice'">공지사항 목록</button></p>

		<form name="noticefrm" id="noticefrm" method="post" action="insert" enctype="multipart/form-data" onsubmit="return noticeCheck()">
		<table class="table">
		<tr>
		   <th class="info" style="text-align:center">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control"></td>
		</tr>
		<tr>
		   <th class="info" style="text-align:center">작성자</th>
		   <td><input type="text" value="관리자" name="writer" id="writer" class="form-control" maxlength="20"></td><!-- input type="email" -->
		</tr>
		
		<tr>
		   <th class="info" style="text-align:center">내용</th>
		   <td><textarea id="content" name="content" rows="5" class="form-control"></textarea></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="등록" class="btn btn-primary">
		       <input type="reset"  value="취소" class="btn btn-danger">
		    </td>
		</tr>  
		</table>
		</form>
	</div>
	

<script>
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

function noticeCheck(){ 
	
	let subject=document.getElementById("subject").value;
	//subject=subject.trim();
	if(subject.length==0){
		alert("제목을 입력하세요");
		return false;
	}//if end
		
	
	let writer=document.getElementById("writer").value;
	if(writer.length==0){
		alert("작성자를 입력하세요");
		return false;
	}//if end
	
	
	let content=document.getElementById("content").value;
	if(content.length==0){
		alert("내용을 입력하세요");
		return false;
	
	}//if end
	
}//noticeCheck() end
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>