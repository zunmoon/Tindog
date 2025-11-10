<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
     
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<style>
.col-sm-4{
	
	height:550px;
	


}


</style>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>


<br>
<br>
<br>
<div class="container">
  <div class="row">
    <div class="col-sm-12">
    	<!-- 검색 -->
    	<form method="get" action="search">

    	<div class="input-group mb-3">
   <!-- 
  <button class="btn btn-outline-secondary" type="button" id="button-addon1" value="${SUBJECT}">Button</button>
  <input type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
   -->
</div>
    				<input type="text" name="subject" value="${SUBJECT}" placeholder="제목으로 검색">
    		       <input type="submit" value="🔎" class="btn" style="margin-right: 10px;">
    		       <button type="button" onclick="location.href='write'" class="btn btn-sm btn-dark">글쓰기</button>
    		       <button type="button" onclick="location.href='list'" class="btn btn-sm btn-dark">전체목록으로 돌아가기</button>
    	</form>	
    	<hr>
    
</div>
</div>



 <div class="row">
    	<!-- varStatus="상태용 변수" -->
		<c:forEach items="${list}" var="row" varStatus="vs">
		
			<div class="col-sm-4">
				<c:choose>
					<c:when test="${row.MAINPHOTO != '-'}">
						
							<img src="/storage/${row.MAINPHOTO}" class="img-responsive margin" style="width:400px; height:400px" >
						
					</c:when>
					<c:otherwise>
						등록된 사진 없음!!<br>
					</c:otherwise>
				</c:choose>
				<br>
   				
				<a href="detail/${row.UPRODUCT_NO}">${row.SUBJECT}</a>
									
				<br>
				<fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>원
				<br>
				${row.AREA}
				<br>
				판매상태 : ${row.STATUS_TEXT}
				
			</div>
            <!-- 한줄에 3칸씩 -->
            <c:if test="${vs.count mod 3==0}">
    
           </c:if>
             
		</c:forEach>		   	 
 </div><!-- row end -->
 </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>