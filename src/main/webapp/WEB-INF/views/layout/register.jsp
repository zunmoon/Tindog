<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html>
<link href="/css/regiModal.css" rel="stylesheet">
<style>
#email:hover{
	cursor: pointer;
}

#nickname:hover{
	cursor: pointer;
}

#post:hover{
	cursor: pointer;
}
</style>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- was-validated  needs-validation -->

	<div id="regi-form">
        <form class="needs-validation" name="register-form" id="register-form" method="post" action="/register/userInsert" enctype="multipart/form-data" novalidate>			
			<h2 class="joinForm">TINDOG ID 생성</h2>
			<h5>하나의 TINDOG ID로 모든 TINDOG 서비스를 이용할 수 있습니다.</h5>
          <div class="row">
            <div class="textForm">              
              <input type="text" class="form-control" name="name" id="name" placeholder="이름" autocomplete="off" required>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="textForm">              
              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" autocomplete="off" onclick="nickCheck()" readonly required>              
              <div class="valid-feedback">
              
              </div>
              <div class="invalid-feedback">
                2글자 이상 10글자 이하로 작성해주세요. <br>특수문자, 공백은 불가능합니다
              </div>
            </div>            
            <div class="textForm">
            	<div class="little">*생년월일*</div>              	
				<input type="date" class="form-control" name="birth" id="birth" max="2024-06-20" min="1900-01-01">								
            </div>
          <div class="textForm">                    
            <input type="text" class="form-control" name="email" id="email" placeholder="name@example.com" autocomplete="off" onclick="remailCheck()" readonly required>
            <div class="valid-feedback">              
              </div>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
            
          <div class="textForm">              
              <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" autocomplete="off" required>
              <div class="valid-feedback">
              
              </div>
              <div class="invalid-feedback">
                6글자 이상 20글자 이하로 작성해주세요. <br>특수문자는 (!,@,#,-,_)만 가능합니다
              </div>
           </div>
            
            
           <div class="textForm">
              <input type="password" class="form-control" name="repasswd" id="repasswd" placeholder="비밀번호확인" autocomplete="off" required>
              <div class="valid-feedback">
              
              </div>
              <div class="invalid-feedback">
                 비밀번호를 확인해주세요.
              </div>
           </div>            

		 <div class="textForm">		         
		           <input type="text" class="form-control" name="post" id="post" onclick= "DaumPostcode()" placeholder="우편번호" readonly="readonly">
		          <!-- <button class="btn btn-outline-secondary" type="button" value="주소찾기" onclick= "DaumPostcode()">주소찾기 </button> -->
			      <!-- <input type="button" value="주소찾기" onclick= "DaumPostcode()"> -->   
			      <!-- ----- DAUM 우편번호 API 시작 ----- -->
			  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			  </div> 
		    <div class="invalid-feedback">
		      우편번호를 입력해주세요.
		    </div>		
		 
          <div>		    
		    <input type="text" class="form-control" name="addr" id="addr" placeholder="주소" required readonly="readonly">
		    <div class="valid-feedback">
              
            </div>
		    <div class="invalid-feedback">
		      
		    </div>
		  </div>
		  <div >		   
			<input type="text" class="form-control" name="detailaddr" id="detailaddr" placeholder="나머지 주소" autocomplete="off" required>
		    <div class="valid-feedback">
              
            </div>
		    <div class="invalid-feedback">
		    	나머지 주소를 입력해주세요.
		    </div>
		  </div>          
		
		</div>
	
		<div class="textForm">
		  <label for="formFile" class="form-label">프로필 사진</label>
		  	<div id="image_container userPic_container" style="margin-bottom:10px;">
				 <img src="img/defaultImg.jpg" alt="기본 이미지" id="uDefault_image" class="img-thumbnail"  style="width: 20%" />
			</div>
		  <input class="form-control" type="file" id="userphotofile" name="userphotofile" accept="image/*">
 		</div>
 		
 	 </div>
 	 	
	  <div id="register-else">
	    <hr id="bar">    
	    <hr id="bar">
	  </div>
 		
 		<h2 class="joinForm">강아지정보</h2>
          <input type="hidden" name="dogorder" value="1">
          
          	<!-- 강아지 이름, 나이 -->
          <div class="row">
            <div class="textForm">              
              <input type="text" name="dname" id="dname" class="form-control" placeholder="강아지 이름" autocomplete="off" required>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback">
                강아지 이름을 입력해주세요.
              </div>
            </div>
            <div class="textForm">
              <input class="form-control" type="number" name="age" id="age" placeholder="강아지 나이" autocomplete="off" required>
              <div class="invalid-feedback">
                강아지 나이를 입력해주세요.
              </div>
            </div>
          </div>
		
	<div class="row">
		<div class="textForm">        
        <input class="form-control" type="number" name="weight" id="weight" placeholder="강아지 무게 : kg" autocomplete="off" required>
        <div class="invalid-feedback">
          강아지 무게를 입력해주세요.
        </div>
      </div>   	
      
      <div class="selectForm">
      	<div class="nobox">
			<div class="title">강아지 성별</div>
			<div class="form-check">
				<input type="radio" name="sex" value="m">
				<label> 남아	</label>
			</div>
			<div class="form-check">
				<input type="radio" name="sex" value="f">
				<label> 여아	</label>
			</div>
			<div class="blank">
			/
			</div>
			<div class="title"></div>
			<div class="title">중성화 여부</div>
			<div class="form-check">
				<input type="radio" name="neutral"	value="o">
				<label> O </label>
			</div>
			<div class="form-check">
				<input type="radio" name="neutral"	value="x">
				 <label> X </label>
			</div>
		</div>
	  </div>          
    <div class="selectForm">
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">강아지 사이즈</label>
	  <select class="form-select" id="size" name="size">
	    <option value="1">소형견</option>
	    <option value="2">중형견</option>
	    <option value="3">대형견</option>
	  </select>
	</div>
	</div>
	<div class="selectForm">          
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">강아지 종</label>
	  <select class="form-select" id="dogcd" name="dogcd">
	  			<option value="0">선택</option>
	  		<c:forEach var="item" items="${list}">
	  			<option value="${item.DOGCD}">${item.DOGTYPE}</option>
	  		</c:forEach>
	    	<!-- <option value="1">포메라이언</option>
			<option value="2">사모예드</option>
			<option value="3">골든리트리버</option>
			<option value="4">토이푸들</option>
			<option value="5">보더콜리</option>
			<option value="6">알래스칸 클리카이</option>
			<option value="7">비숑 프리제</option>
			<option value="8">시바견</option>
			<option value="9">진돗개</option>
			<option value="10">폼피츠</option> -->
	  </select>
	</div>	
	</div>
</div>
	
		<div class="textForm">
		  <label for="formFile" class="form-label">강아지 대표사진</label>
		<div id="image_container mainPic_container" style="margin-bottom: 10px;">
		 <img src="/img/defaultImg.jpg" alt="기본 이미지" id="mDefault_image"  style="width: 20%" />
		</div>
		  <input class="form-control" type="file" id="mainphotofile" name="mainphotofile" accept="image/*">
		</div>
		
		<div class="textForm">
		  <label for="formFileMultiple" class="form-label">기타사진등록 (*3개까지 가능)</label>
		  <input class="form-control" type="file" id="dPics" name="dPics" accept="image/*" multiple="multiple">
		</div>
		
		<div class="selectForm">
           <label for="nickname">이상형월드컵 참여여부</label>
		   <div class="form-check">
		  <input type="radio" name="gamereg" value="o" checked>
		  <label>
		    예
		  </label>
		</div>
		<div class="form-check">
		  <input type="radio" name="gamereg" value="x">
		  <label>
		    아니요
		  </label>
		</div>
		</div>
		
		
		
		<div class="selectForm">
			<div class="input-group mb-3">
			  <label class="input-group-text" for="inputGroupSelect01">이상형월드컵 목적</label>
			  <select class="form-select" id="purpose" name="purpose">
			    <option value="1">산책</option>
			    <option value="2">데이트</option>
			    <option value="3">둘다</option>
			  </select>
			</div>	
        </div>
        
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
 		<div class="button">
          <button class="btn-regi" type="submit">계속</button>
        </div>
        </form>
        </div>
        
        
 <!-- 모달창 -->
 <!-- 닉네임 모달 -->
 <div id="nick-check-modal">	
    <div id="nick-check-modal-body" class="textForm">              
              <input type="text" class="form-control" name="nickname2" id="nickname2" placeholder="닉네임" autocomplete="off" style="margin-bottom: 20px;"  required>              
              <div class="valid-feedback">
              </div>
              <div class="invalid-feedback">
                2글자 이상 10글자 이하로 작성해주세요. <br>특수문자, 공백은 불가능합니다
              </div>
              <button class="btn-regi" id="nick-check-btn">중복확인</button>
    	<span id="nick-check-close"> X </span>
    </div>
 </div>
 <!-- 이메일 모달 -->
   <div id="email-check-modal">	
    <div id="email-check-modal-body" class="textForm">            
          <input type="text" class="form-control" name="email2" id="email2" placeholder="name@example.com" autocomplete="off" style="margin-bottom: 20px;" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
           	<button class="btn-regi" id="email-check-btn">중복확인</button>
			<span id="email-check-close"> X </span>
       </div>

    </div>
    <!-- 모달창 끝 --> 
 
 
 
 
    
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  
  
      // 우편번호 찾기 찾기 화면을 넣을 element
      var element_wrap = document.getElementById('wrap');

      function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }

      function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("detailaddr").value = extraAddr;
                  
                  } else {
                      document.getElementById("detailaddr").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('post').value = data.zonecode;
                  document.getElementById("addr").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("detailaddr").focus();

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';

                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);

          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }
      
      //강아지 기타사진 3개까지만 받기 
      const input = document.getElementById('dPics');

      input.addEventListener('change', function() {
          if (this.files.length > 3) {
              alert('최대 3개의 파일만 선택할 수 있습니다.');
              this.value = ''; // 선택한 파일 초기화
          }
      });    
	
	document.querySelector("#dname").addEventListener("input", function(){
		let inputDname=this.value;
		if(inputDname.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[A-Za-z가-힣0-9]{1,10}$/
		
		if(regEx.test(inputDname)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.dnameValid=true;
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.dnameValid=false;
		}
	});
	
	document.querySelector("#age").addEventListener("input", function(){
		let inputAge=this.value;
		if(inputAge.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[0-9]/
		
		if(regEx.test(inputAge)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.dageValid=true;
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.dageValid=false;
		}
	});
	
	document.querySelector("#weight").addEventListener("input", function(){
		let inputWeight=this.value;
		if(inputWeight.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[0-9]/
		
		if(regEx.test(inputWeight)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.weightValid=true;
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.weightValid=false;
		}
	});
  </script>


<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>