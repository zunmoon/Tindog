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
	
	
	
	
	
	
	<style>
	
	.carousel{
	
	width:500px;
    margin: auto;
	
	}
	
	.img-username{
		
		img{
		 	width:70px;
		 	height:70px;
			border-radius: 50%;
		}
	}
	
	.carousel-indicators{
		visibility: hidden;
	}
	
		#like{
      width: 50px;
      fill: #ddd;
			}
	#like.active{
      fill: red;
}
	.product-userinfo{
		display:flex;
		line-height:5;
		justify-content:center;
		 margin-top: 20px;
	
	
	}
	.img-username{
		display:flex;
		img{
			margin-right: 10px;
		}
	}
	
	.cart-chat{
	
		display:flex;
		margin-left:300px
		
	}
	.product-info{
		color:black; 
		margin-left:400px
		
	
	}
	
	</style>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeaderAlert.jsp"></jsp:include>

<c:if test="${isSeller}">
<div class="container" style="margin-top:50px;">


  <div id="photoNext" class="carousel slide">
					<div id="carouselExampleIndicators" class="carousel slide carousel-slide text-center">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
								aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
								aria-label="Slide 2"></button>
							
						</div>
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
							    </div>
							   
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
						</div>
		  
		  
	</div>
			
		<div class="product-userinfo">
			<div class="img-username">
			  <img src="/img/dog1.jpeg"><!-- ${product.MEMBER.USERPHOTO} -->
			  	<a href="/hoogi/${product.NICKNAME}">${product.NICKNAME}</a>

			  	<div class="cart-chat">

					<div class="heart-btn">
								<svg id="like" xmlns="http://www.w3.org/2000/svg" height="35" width="35" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
					</div>
								  	<div>
					<input type="button" value="채팅하기"  class="btn btn-sm btn-dark">
				</div>
			</div>
			</div>
		</div>
		<hr>
		
			
		  수정할 제목을 입력해주세요 
		  <input type="text" name="subject" class="form-control" value="${product.SUBJECT}" >
		  수정할 가격을 입력해주세요
		  <input type="number" name="price" class="form-control" value="${product.PRICE}">
		   수정할 내용을 입력해주세요
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

		
		 
		 
		    </form>
</div><!-- container end -->
</c:if>
<c:if test="${not isSeller}">
<div class="container" style="margin-top:50px;">


  <div id="photoNext" class="carousel slide">
					<div id="carouselExampleIndicators" class="carousel slide carousel-slide text-center">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
								aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
								aria-label="Slide 2"></button>
							
						</div>
							  <div class="carousel-inner">
							   <form name="productfrm" id="productfrm" method="post" enctype="multipart/form-data">
			         <input type="hidden" name="uproduct_no" value="${product.UPRODUCT_NO}">	
							    <div class="carousel-item active">
							     
			               	<img src="/storage/${product.MAINPHOTO}" width="100px">
			          
			            <br><br>
					
							    </div>
							    <div class="carousel-item">
							      
			               	<img src="/storage/${product.PHOTO}" width="100px">
			          
			            <br><br>
						
		                </div>
							    </div>
							   
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
						</div>
		  
		  
	</div>
			
		<div class="product-userinfo">
			<div class="img-username">
			  <img src="/img/dog1.jpeg"><!-- ${product.MEMBER.USERPHOTO} -->
			  	<a href="/hoogi/${product.NICKNAME}">${product.NICKNAME}</a>

			  	<div class="cart-chat">

					<div class="heart-btn">
								<svg id="like" xmlns="http://www.w3.org/2000/svg" height="35" width="35" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
					</div>
								  	<div>
					<input type="button" value="채팅하기"  class="btn btn-sm btn-dark">
				</div>
			</div>
			</div>
		</div>
		<hr>
		
		<div class="product-info">
			<span style="font-size:30px;">${product.SUBJECT}</span><br>
			<span style="font-size:20px;">${product.PRICE}원</span><br>
			<span>${product.INFO}</span><br>
		
		</div>
			
		
		 
		    </form>
</div><!-- container end -->
</c:if>
<script>
var btn = document.getElementById("like")

		btn.addEventListener('click',function(){
		          btn.classList.toggle('active');
		          product_wishlist();
		  	});

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>









