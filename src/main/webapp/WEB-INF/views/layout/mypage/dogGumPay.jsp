<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table, tbody, tr, td{
	border: 2px solid #fff; 
	color : black;

}


</style>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="/WEB-INF/views/common/header-login.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
<div class="cont">
		<div class="dogInfoText">
			<div style="border-bottom: solid 2px darkgrey;">개껌페이</div>
		</div>
		
	<div>
		<table class="table table-borderless">
		  <tbody>
		    <tr>
		      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 1개</th>
		      <td>1000원</td>
		      <td><button type="button" class="btn btn-outline-primary" onclick="requestPay('1', '1','${email}')">결제</button></td>
		    </tr>
		    <tr>
		      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 11개</th>
		      <td>10000원</td>
		      <td><button type="button" class="btn btn-outline-primary" onclick="requestPay('11', '1','${email}')">결제</button></td>
		    </tr>
		    <tr>
		      <th scope="row"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/dog-bone.png" alt="dog-bone"/> 35개</th>
		      <td>30000원</td>
		      <td><button type="button" class="btn btn-outline-primary" onclick="requestPay('35', '1','${email}')">결제</button></td>
		    </tr>
		  </tbody>
		</table>
	</div>
		
</div>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>


function generateOrderNumber() {
	
	  const currentDate = new Date();
	  const year = currentDate.getFullYear();
	  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
	  const day = String(currentDate.getDate()).padStart(2, '0');
	  const hours = String(currentDate.getHours()).padStart(2, '0');
	  const minutes = String(currentDate.getMinutes()).padStart(2, '0');
	  const seconds = String(currentDate.getSeconds()).padStart(2, '0');
	  const randomDigits = Math.floor(Math.random() * 100); // 임의의 세 자리 숫자 생성 (0부터 999까지)

	  const orderNumber = year + month + day + hours + minutes + seconds + '-' +randomDigits;
	  
	  //alert(year);
	  //alert(month);
	  //alert(day);
	  //alert(orderNumber);
	  
	  return orderNumber;
	}


const orderNumber = generateOrderNumber();




<!--아임포트-->
var IMP = window.IMP;
IMP.init('imp04014474') // 예: 'imp00000000a'


function requestPay(productName, price, email){
	
	const params = {
		"email" : email
	}

IMP.request_pay({
	pg : 'html5_inicis',
    pay_method: "card",
    merchant_uid: 'P_' + orderNumber ,
    name: productName,
    amount: price,
    buyer_email: email,
    buyer_name: "포트원 기술지원팀",
    buyer_tel: "010-1234-5678",
    buyer_addr: "서울특별시 강남구 삼성동",
    buyer_postcode: "123-456",
    
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	Swal.fire("결제 성공", "", "success");
    	$.ajax({
    		
    		url: "/confirmPay/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		//dataType: 'json',
    		data: params, 
    		success: data => {
    			console.log(data);
                if(data.result === "SUCCESS"){
                    //결제실패(웹서버측 실패)
                    console.log(data);
                }else{
                	Swal.fire("결제 실패", "", "error");
                }
               },
               //javascript error
               error: function(jqXHR, textStatus, errorThrown) {
        console.log("Ajax 요청 실패:", textStatus, errorThrown);
        console.log("상세 정보:", jqXHR.responseText);
        // jqXHR.responseText에는 서버로부터 받은 응답의 상세 내용이 들어있습니다.
    }
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
    			
    			Swal.fire({
    	        	title:"결제 완료", 
    	        	text:"결제 금액 : "+rsp.paid_amount,
    	        	icon:"success",
    	        	confirmButtonText:"확인"	
    	        });    			
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다. ';
        msg += '에러내용 : ' + rsp.error_msg;
        
        Swal.fire({
        	title:"결제 실패", 
        	text:"에러 내용 : "+rsp.error_msg,
        	icon:"error",
        	confirmButtonText:"확인"	
        });
    }
});

}//function end


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>    
