<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

 <!-- 1라운드 -->
	<div id="img-round16-container">
		 <img id="img-round16" src="/img/img-round16.png">
	     <!-- <input type="image" src="" id="vimg" width="500px" height="550px"></a><!-- src --> 
	</div>
	<table id="worldcup-table" style="margin-left:auto; margin-right:auto; margin-top: 70px; margin-bottoom:130px;">
		<tbody id="worldcup-tbody">
		<tr>
			<td>
			<div id="worldcupImgContainer">
				 <img id="Left-img" onclick="worldcupGame(this.id)">
			     <!-- <input type="image" src="" id="vimg" width="500px" height="550px"></a><!-- src --> 
			</div>
			</td>
			
			<td><p style="color: black; font-weight: bold; font-size: 40px;">VS</p></td>
			
			<td>
			<div id="worldcupImgContainer">
				<img id="right-img" onclick="worldcupGame(this.id)">
			     <!-- <input type="image" src="" id="simg" width="500px" height="550px"></a><!-- src -->
			</div> 
			</td>
		</tr>
		</tbody>
	</table>
           
           <script>       
            
           
           var imageList = [
               <c:forEach var="image" items="${OptionList}" varStatus="status">
                   {
                       "mainphoto": "${image.mainphoto}"
                   }<c:if test="${!status.last}">,</c:if>
               </c:forEach>
           ];
           
			
           var emailList = [
               <c:forEach var="image" items="${OptionList}" varStatus="status">
                   {
                       "email": "${image.email}"
                   }<c:if test="${!status.last}">,</c:if>
               </c:forEach>
           ];
           
           var emailImgList = [
               <c:forEach var="image" items="${OptionList}" varStatus="status">
                   {
                       "image": "${image.mainphoto}",
                       "email": "${image.email}"
                   }<c:if test="${!status.last}">,</c:if>
               </c:forEach>
           ];
           
           
           var pic = {}; // 빈 객체 생성

           for (var i = 0; i < imageList.length; i++) {
               var imageURL = imageList[i]['mainphoto'];
               pic['pic' + (i + 1)] = "/img/" + imageURL; // 동적으로 프로퍼티 추가
           }
              
            document.querySelector("#Left-img").src =pic.pic1;
            document.querySelector("#right-img").src = pic.pic2;

       
            var round8 = []; // 16강 라운드 이미지를 담을 배열
            var round4 = [];
            var round2 = [];
            var winner = [];

            var currentRound = 16; // 현재 라운드 (8강)
            var currentRoundIndex = 1; // 현재 라운드의 이미지 인덱스

            
            /*월드컵 시작*/	
            function worldcupGame(clickedImageId) {
            		
                
            	var clickedImage = document.getElementById(clickedImageId);
                var clickedImageSrc = clickedImage.src;
                clickedImageSrc = clickedImageSrc.substring(21);
                
               	var round8Img = document.getElementById("img-round16");
               		round8ImgSrc = round8Img.src;

                
                /*16강전*/
                
                if(round8.length < 8 && currentRound === 16) {
                	
                	round8.push(clickedImageSrc);
                    // 다음 이미지 설정
                    //alert("16강진행중" + currentRoundIndex);
                    if(currentRoundIndex < 8){
 	
                    document.querySelector("#Left-img").src = pic['pic' + (currentRoundIndex * 2 + 1)]; // 다음 이미지 설정
                    document.querySelector("#right-img").src = pic['pic' + (currentRoundIndex * 2 + 2)]; // 다음 이미지 설정
                    currentRoundIndex++;
                    console.log(currentRoundIndex);
                    console.log(round8);   
                    }    
                    
                }else if(round8.length === 8 && currentRoundIndex === 8) {
                    document.querySelector("#Left-img").src = round8[0]; // round8 배열 첫 번째 이미지
                    document.querySelector("#right-img").src = round8[1]; // round8 배열 두 번째 이미지
                	
                    console.log('16강이 끝났습니다!');
                    console.log('8강 Start!!!');
                    console.log(round4);
                    console.log("현재라운드 : "+ currentRound)
                    
                    round8Img.src = "/img/img-round8.png";                 	
                    currentRound = 8; // 라운드를 반으로 줄임
                    currentRoundIndex = 1; // 다음 라운드를 위해 인덱스 초기화
				
                }else if(round4.length < 4 && currentRound === 8) { //8강 
					 
                    // 다음 이미지 설정
                    
                    //alert("8강진행중" + currentRoundIndex);
                    round4.push(clickedImageSrc);
                    
                    if(currentRoundIndex < 4){
                    	
                    	 document.querySelector("#Left-img").src = round8[(currentRoundIndex * 2 )]; // round8 배열 첫 번째 이미지
                         document.querySelector("#right-img").src = round8[(currentRoundIndex * 2 + 1)]; // 다음 이미지 설정
                         currentRoundIndex++;
                         console.log(currentRoundIndex);
                         console.log(round4); 
                    }
                    
                }else if(round4.length === 4 && currentRoundIndex === 4){
                	
                   console.log(round4);
                    round8Img.src = "/img/img-round4.png"
                    

                    document.querySelector("#Left-img").src = round4[0]; // round8 배열 첫 번째 이미지
                    document.querySelector("#right-img").src = round4[1]; // round8 배열 두 번째 이미지
                	
                    currentRound = 4; // 라운드를 반으로 줄임
                    currentRoundIndex = 1; // 다음 라운드를 위해 인덱스 초기화
                    console.log(round2)
                    
                }else if(round2.length < 2 && currentRound === 4) { //4강 
					 
                    // 다음 이미지 설정
                    
                    //alert("4강진행중" + currentRoundIndex);
                    round2.push(clickedImageSrc);
                    
                    if(currentRoundIndex < 2){
                    	
                    	 document.querySelector("#Left-img").src = round4[(currentRoundIndex * 2 )]; // round8 배열 첫 번째 이미지
                         document.querySelector("#right-img").src = round4[(currentRoundIndex * 2 + 1)]; // 다음 이미지 설정
                         currentRoundIndex++;
                         console.log(currentRoundIndex);
                         console.log(round4); 
                    }
                    
                }else if(round2.length === 2 && currentRoundIndex === 2){
                	                  
                   console.log(round4);
                    round8Img.src = "/img/img-round_final.png"
                    

                    document.querySelector("#Left-img").src = round2[0]; // round8 배열 첫 번째 이미지
                    document.querySelector("#right-img").src = round2[1]; // round8 배열 두 번째 이미지
                    currentRound = 2; // 라운드를 반으로 줄임
                    currentRoundIndex = 1; // 다음 라운드를 위해 인덱스 초기화
                    console.log(round2)
                    
                }else if (winner.length ===0 && currentRound === 2) {
                    // 16강 라운드가 끝났으면
                    winner.push(clickedImageSrc);

                    round8Img.src = "/img/Winner.png"
                    

                   
                   var winnerImgName = winner[0].substring(5);
                   
                   
                   function findEmailByImageName(emailImgList, emailList, winnerImgName) {
                	    for (var i = 0; i < emailImgList.length; i++) {
                	        if (emailImgList[i].mainphoto === winnerImgName) {
                	            return emailList[i].email;
                	        }
                	    }
                	    return "해당하는 우승자에 대한 이메일을 찾을 수 없습니다.";
                	}//findEmailByImageName end
                   
                   var email = findEmailByImageName(imageList, emailList, winnerImgName);
                	
                	console.log(email);

                   $.ajax({
                	    type: "GET", // 또는 POST 등 HTTP 요청 방법 설정
                	    url: "/worldcup/final", // 엔드포인트 URL
                	    data: { email: email }, // 전송할 데이터
                	    success: function(response) {
                	        // 성공 시 처리하는 로직
                	        console.log("전송 완료!");
                	        window.location.href = "/worldcup/final?email=" + encodeURIComponent(email);
                	        // response에 서버에서 받은 응답이 들어있음
                	    },
                	    error: function(err) {
                	        // 에러 발생 시 처리하는 로직
                	        console.error("전송 실패!", err);
                	    }
                	});
                    
                }//final end
               
                
            }//worldcupGame end
            
            
            </script>
            
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>