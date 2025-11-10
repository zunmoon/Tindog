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
		.carousel{width:500px;margin: auto;}			
		.img-username{			
			img{
			 	width:70px;
			 	height:70px;
				border-radius: 50%;
			}
		}		
		.carousel-indicators{visibility: hidden;}		
		#like{width: 50px;fill: #ddd;}
		#like.active{fill: red;}
		.product-userinfo{display:flex;line-height:5;justify-content:center;margin-top: 20px;}
		.img-username{display:flex;
			img{
				margin-right: 10px;
			}
		}		
		.cart-chat{display:flex;margin-left:300px}
		.product-info{color:black;margin:auto;width:500px;}
		.col-md-4{margin:auto;}
	</style>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeaderAlert.jsp"></jsp:include>

<!-- 판매자 -->
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
						    <div class="carousel-item active">
						 <c:choose>
			            <c:when test="${userphoto} == 'PHOTO'}">
			                <img src="img/defaultImg.jpg" alt="기본 이미지" id="" width="500px"  height=400px; />
			            </c:when>
			            <c:otherwise>
			                <img src="/storage/${product.MAINPHOTO}" id="" alt="기본 이미지" width="500px"  height=400px; />
			            </c:otherwise>
			       			 </c:choose>
						    <!-- 
						       	<c:if test="${product.MAINPHOTO != '-'}">
			               			<img src="/storage/${product.MAINPHOTO}" width="500px"  height=400px;>
			            		</c:if>
			            	 -->
			            		<br><br>
						    </div>
						    <div class="carousel-item">
						       	<c:if test="${product.PHOTO != '-'}">
			               			<img src="/storage/${product.PHOTO}" width="500px" height=400px;>
					            </c:if>
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
			  <img src="/img/defaultImg.jpg"><!-- ${product.MEMBER.USERPHOTO} -->
			  	<a href="/hoogi/${product.NICKNAME}">${product.NICKNAME}</a>

			  	 <div class="cart-chat">

					<!-- <div class="heart-btn">
						<svg id="like" xmlns="http://www.w3.org/2000/svg" height="35" width="35" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
					</div>
				<div>
					<input type="button" value="채팅하기"  class="btn btn-sm btn-dark">
				</div>  -->
			</div>
			</div>
		</div>
		<hr>
		<form name="productfrm" id="productfrm" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="uproduct_no" value="${product.UPRODUCT_NO}">	
			<div class="text-center">
		  		<div class="col-md-4"style="margin:auto;">
		  			<input type="file" name="img1" class="form-control"> 
		  			<input type="file" name="img2" class="form-control"> 
		  			<br><br>
		  			수정할 제목을 입력해주세요 
		 		</div>
		 		<div class="col-md-4">
		  			<input type="text" name="subject" class="form-control" value="${product.SUBJECT}" >
		  			수정할 가격을 입력해주세요
		  		</div>
		   		<div class="col-md-4">
		  			<input type="number" name="price" class="form-control" value="${product.PRICE}">
		   			수정할 내용을 입력해주세요
		   		</div>
		   		<div class="col-md-4">
		  			<textarea rows="3" cols="30" name="info" class="form-control" style="width:470px;">${product.INFO }</textarea>
		  		</div>
		  		<c:if test="${isAuthor}">
		   			<div class="col-md-4">
		   				상품 상태 수정시, 판매중은 1, 판매완료는 2를 선택해주세요
		  				<select name="status" class="form-control" value="${product.STATUS}">
					 	 	<option value="1">1</option>
					 	 	<option value="2">2</option>
		  				</select>
		  			</div>
		  			<div class="col-md-4 buttons" style="margin-top: 10px;">
		  				<input type="button" value="상품수정"    onclick="product_update()" class="btn btn-sm btn-dark"> 
		  				<input type="button" value="상품삭제"    onclick="product_delete()" class="btn btn-sm btn-dark">
		    		</div>
		    	</c:if>	
		  	</div>
		</form>   
		
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
							<img src="/storage/${product.MAINPHOTO}" width="500px" height=400px;>
			         		<br><br>
						</div>
						<div class="carousel-item">
						   	<img src="/storage/${product.PHOTO}" width="500px" height=400px;>
			          		<br><br>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						</button>
						<hr>
					</form>
				</div>
				  <div class="product-userinfo">
							<div class="img-username">
			  			<c:choose>
			            <c:when test="${userphoto} == 'PHOTO'}">
			                <img src="img/${userphoto}" alt="기본 이미지" id="" width="500px"  height=400px; />
			            </c:when>
			            <c:otherwise>
			                <img src="/img/defaultImg.jpg" id="" alt="기본 이미지" width="500px"  height=400px; />
			            </c:otherwise>
			       		</c:choose>
			  					<a href="/hoogi/${product.NICKNAME}" style="width: 50px;}">${product.NICKNAME}</a>
							</div>
			  				<div class="cart-chat">
								<div class="heart-btn">
									<svg id="like" xmlns="http://www.w3.org/2000/svg" height="35" width="35" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
								</div>
							</div>
							<div>
								<input type="button" value="채팅하기"  class="btn btn-sm btn-dark" onclick="product_chatStart('${product.NICKNAME}', ${product.UPRODUCT_NO})" >
							</div>
				  </div>
				<div class="product-info">
							<span style="font-size:30px;">${product.SUBJECT}</span><br>
							<span style="font-size:20px;">${product.PRICE}원</span><br>
							<span>${product.INFO}</span><br>
				</div>
			</div>
		</div>
	</div><!-- container end -->
</c:if>
<script>

var btn = document.getElementById("like")

window.onload = function () {

var s_nickname = sessionStorage.getItem('s_nickname') || localStorage.getItem('s_nickname');

var isLiked = localStorage.getItem('isLiked_' + s_nickname);

if (isLiked === 'true') {

btn.classList.add('active');

}

}

btn.addEventListener('click',function(){

btn.classList.toggle('active');

var s_nickname = sessionStorage.getItem('s_nickname') || localStorage.getItem('s_nickname');

localStorage.setItem('isLiked_' + s_nickname, btn.classList.contains('active'));

product_wishlist();

});

</script>
<script>
function product_chatStart(nickname, uproduct_no) {
	$.ajax({
			url     : '/product_chatList/insert' // 요청 명령어
		  , type    : 'post'
		  , data    : {'nickname':nickname, 'uproduct_no':uproduct_no}        // 전달값
	      , error   : function(error){
	    	Swal.fire({
			title:"채팅방 개설 실패",
			text:"관리자에게 문의해주세요",
			icon:"error",
			confirmButtonText:"확인"
	});	
	      }
	      , success : function(result){
	    	  // alert(result);
	    	  if(result==1) { // 댓글 등록 성공
	    		Swal.fire({
				title:"채팅방 개설 성공",							
				text:"채팅목록으로 이동합니다",
				icon:"success",
				confirmButtonText:"확인"
			}).then(function(){					  
		  		window.location.href = '/chatList';
				});
	    	  } else if(result==-1) {
			  alert("채팅방이 개설되지 않았습니다");
		  } else if(result==0) {
			  Swal.fire({
					title:"이미 개설된 채팅방이 있습니다",							
					text:"채팅목록으로 이동합니다",
					icon:"success",
					confirmButtonText:"확인"
			}).then(function(){					  
			  window.location.href = '/chatList';
			});					  
		  }
	      }
		}); 
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>









