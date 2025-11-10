 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
     
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>

<script>
 
	  function WishlistDelete(wishlist_no){
	  if(confirm("해당 상품을 삭제할까요?")){
        location.href='/layout/delete?wishlist_no=' + wishlist_no;
	  }//if end
	}//WishlistDelete() end
				
 </script>
 
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

<div class="container text-center">
    <!-- 본문 시작 -->
  <div class="row">
    <div class="col-sm-12">
      <p><h3>찜 목록</h3></p>
            
    </div><!-- col end -->
   </div><!-- row end -->
   
   <div class="row">
    <div class="col-sm-12">
    <form name="wishlistfrm" id="wishlistfrm" method="post" enctype="multipart/form-data">
        <table class="table table-hover">
        <thead class="table-success">
          <th>대표사진</th>
          <th>목록번호</th>
          <th>닉네임</th>
          <th>글제목</th>
          <th>가격</th>
          <th>삭제</th>
        </thead>
        <tbody>
         
         <c:forEach items="${list}" var="row">
           <tr>
             <td><img src="/storage/${row.MAINPHOTO}" width="80" height="80"></td>
             <td>${row.WISHLIST_NO}</td>
             <td>${row.NICKNAME}</td>
             <td>${row.SUBJECT}</td>
             <td>${row.PRICE}</td>
             <td>
                 <input type="button" value="삭제" onclick="WishlistDelete('${row.WISHLIST_NO}')">
             </td>
           </tr>
         </c:forEach>
     
        
        </tbody>
        </table>
        </form>
        <hr>
        <input type="button" value="다른 물품 보기" onclick="location.href='/list'">
    </div><!-- col end -->
   </div><!-- row end -->
   
   
   <!-- 본문  끝 -->
</div> <!-- container end -->





<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>