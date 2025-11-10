<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
     
    
<!DOCTYPE html>
<html>


<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<script>
	
		function product_update() {
			document.productfrm.action="/update";
			document.productfrm.submit();
		}//product_update() end
		
		function product_delete() {
			if(confirm("글 삭제시 구매자의 찜목록에서도 삭제됩니다\n 그래도 삭제하시겠습니까?")){
				document.productfrm.action="/delete";
				document.productfrm.submit();
			}//if end
		}//product_delete() end
		
		function product_cart(){
			
				document.productfrm.action="/layout/wishlist";
				document.productfrm.submit();
			
		}//product_cart() end
		
		function product_wishlist(){
			
			document.productfrm.action="/layout/insert";
			document.productfrm.submit();
		
	}//product_wishlist() end
		
	</script>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeaderAlert.jsp"></jsp:include>


<div class="container text-center">

 <div class="row">
    <div class="col-sm-6">
    	
	    <p>
	        <button type="button" onclick="location.href='/list'" class="btn btn-primary">상품전체목록</button>
	    </p> 
	  <br>
	  <br>
	  
	  <img src="/img/${member.USERPHOTO}" width="100px"><br>
	  <a href="/hoogi/${product.NICKNAME}">${product.NICKNAME}</a>
	  <br>
    </div><!-- col end -->
  </div><!-- row end -->

  <div id="photoNext" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		  <form name="productfrm" id="productfrm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="uproduct_no" value="${product.UPRODUCT_NO}">	
		    <div class="carousel-item active">
		      <c:if test="${product.MAINPHOTO != '-'}">
			               	<img src="/storage/${product.MAINPHOTO}" width="100px">
			            </c:if>
			            <br><br>
						<input type="file" name="img1" class="form-control"> 
		    </div>
		    <div class="carousel-item">
		      <c:if test="${product.PHOTO != '-'}">
			               	<img src="/storage/${product.PHOTO}" width="100px">
			            </c:if>
			            <br><br>
						<input type="file" name="img2" class="form-control"> 
		    </div>
		   <br><br><br><br><br><br><br><br>
		   
		   제목을 입력해주세요 
		  <input type="text" name="subject" class="form-control" value="${product.SUBJECT}" >
		  가격을 입력해주세요
		  <input type="number" name="price" class="form-control" value="${product.PRICE}">
		   내용을 입력해주세요
		  <textarea rows="5" cols="60" name="info" class="form-control">${product.INFO }</textarea>
		 
		  <c:if test="${isAuthor}">
		   상품 상태 수정시, 판매중은 1, 판매완료는 2를 선택해주세요
		  <select name="status" class="form-control" value="${product.STATUS}">
					 	  <option value="1">1</option>
					 	  <option value="2">2</option>
		  </select>      
		  <input type="button" value="상품수정"    onclick="product_update()" class="btn btn-warning"> 
		  <input type="button" value="상품삭제"    onclick="product_delete()" class="btn btn-danger"> 
		   </c:if>
		  <input type="button" value="찜 목록" onclick="product_cart()"   class="btn btn-light">
		  <input type="button" value="찜 하기" onclick="product_wishlist()"   class="btn btn-info">
		  <input type="button" value="채팅하기"  class="btn btn-dark">
		 
		 
		    </form>
		  </div>
		  
		  
		  
		  <button class="carousel-control-prev" type="button" data-bs-target="#photoNext" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#photoNext" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		  
		  
	</div>
  
  

</div><!-- container end -->




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>









