<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <style>
  	.container{
  		margin-top:100px;
  	}
  
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>

<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>




  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원정보</h4>
        <form class="validation-form" novalidate name="register-form" id="register-form" method="post" action="userInsert" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="nickname">별명</label>
              <input type="text" class="form-control" name="nickname" id="nickname" required>
              <div class="invalid-feedback">
                별명을 입력해주세요.
              </div>
            </div>
             <div class="col-md-4 mb-3">
              <label for="nickname">생년월일</label>
              <input type="date" class="form-control" name="birth" id="birth">
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
            <div class="row">
            
            <div class="col-md-6 mb-3">
              <label for="name">비밀번호</label>
              <input type="password" class="form-control" name="password" id="password" required>
                <div class="col-auto">
				    <span id="passwordHelpInline" class="form-text">
				      Must be 8-20 characters long.
				    </span>
				 </div>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
            
            
            <div class="col-md-6 mb-3">
              <label for="nickname">비밀번호 확인</label>
              <input type="password" class="form-control" name="repasswd" id="repasswd" required>
              <div class="invalid-feedback">
                 비밀번호를 입력해주세요.
              </div>
            </div>
            
            
          </div>

	
		 <div class="row">
          <div class="col-md-4">
		    <label for="validationCustom03" class="form-label">주소 </label>
		    <input type="text" class="form-control" name="addr" id="addr" required>
		    <div class="invalid-feedback">
		      주소를 입력해주세요.
		    </div>
		  </div>
		  <div class="col-md-3">
		    <label for="validationCustom04" class="form-label">나머지 주소</label>
			<input type="text" class="form-control" name="detailaddr" id="detailaddr" required>
		    <div class="invalid-feedback">
		      나머지 주소를 입력해주세요.
		    </div>
		  </div>
           <div class="col-md-3">
		         <!--  <input type="text" name="post" id="post" size="7"  readonly class="form-select"> -->
		         <label for="validationCustom04" class="form-label">우편번호</label>
		           <input type="text" class="form-control" name="post" id="post" onclick= "DaumPostcode()" placeholder="주소찾기 click">
		          <!-- <button class="btn btn-outline-secondary" type="button" value="주소찾기" onclick= "DaumPostcode()">주소찾기 </button> -->
			      <!-- <input type="button" value="주소찾기" onclick= "DaumPostcode()"> -->   
			      <!-- ----- DAUM 우편번호 API 시작 ----- -->
			  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			  </div> 
		    <div class="invalid-feedback">
		      우편번호를 입력해주세요.
		    </div>
		  </div>
		</div>
	

		<div class="mb-3">
		  <label for="formFile" class="form-label">유저사진</label>
		  	<div id="image_container userPic_container">
				 <img src="img/defaultImg.jpg" alt="기본 이미지" id="uDefault_image" class="img-thumbnail"  style="width: 20%" />
			</div>
		  <input class="form-control" type="file" id="userphotofile" name="userphotofile" accept="image/*">
		</div>

          
          <h4 class="mb-3">강아지정보</h4>
          <input type="hidden" name="dogorder" value="1">
          
          	<!-- 강아지 이름, 나이 -->
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="name">강아지 이름</label>
              <input type="text" name="dname" id="dname" class="form-control" required>
              <div class="invalid-feedback">
                강아지 이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-2 mb-3">
              <label for="nickname">강아지 나이</label>
              <input class="form-control" type="number" name="age" id="age" required>
              <div class="invalid-feedback">
                강아지 나이를 입력해주세요.
              </div>
            </div>
          </div>

          <div class="col-md-2 mb-3">
           <label for="nickname">강아지 성별</label>
		   <div class="form-check">
		  <input class="form-check-input" type="radio"name="sex" value="m">
		  <label class="form-check-label" for="flexRadioDefault1">
		    남아
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="sex" value="f" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    여아
		  </label>
		</div>
		</div>
          
          
          <div class="col-md-2 mb-3">
           <label for="nickname">중성화 여부</label>
		   <div class="form-check">
		  <input class="form-check-input" type="radio" name="neutral" value="o">
		  <label class="form-check-label" for="flexRadioDefault1">
		    O
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="neutral" value="x" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    X
		  </label>
		</div>
		</div>
          
          

        <div class="col-md-2 mb-3">
        <label for="weight">강아지 무게</label>
        <input class="form-control" type="number" name="weight" id="weight" placeholder="kg" required>
        <div class="invalid-feedback">
          강아지 나이를 입력해주세요.
        </div>
      </div>

          
          <div class="col-md-4 mb-3">
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">강아지 사이즈</label>
	  <select class="form-select" id="size" name="size">
	    <option value="1">소형견</option>
	    <option value="2">중형견</option>
	    <option value="3">대형견</option>
	  </select>
	</div>	
          </div>
          
      <div class="col-md-4 mb-3">
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">강아지 종</label>
	  <select class="form-select" id="dogcd" name="dogcd">
	    	<option value="1">포메라이언</option>
			<option value="2">사모예드</option>
			<option value="3">골든리트리버</option>
			<option value="4">토이푸들</option>
			<option value="5">보더콜리</option>
			<option value="6">알래스칸 클리카이</option>
			<option value="7">비숑 프리제</option>
			<option value="8">시바견</option>
			<option value="9">진돗개</option>
			<option value="10">폼피츠</option>
	  </select>
	</div>	
	</div>
	
		<div class="mb-3">
		  <label for="formFile" class="form-label">강아지 대표사진</label>
		<div id="image_container mainPic_container">
		 <img src="img/defaultImg.jpg" alt="기본 이미지" id="mDefault_image"  style="width: 20%" />
		</div>
		  <input class="form-control" type="file" id="mainphotofile" name="mainphotofile" accept="image/*">
		</div>
		
		<div class="mb-3">
		  <label for="formFileMultiple" class="form-label">기타사진등록 (*3개까지 가능)</label>
		  <input class="form-control" type="file" id="dPics" name="dPics" accept="image/*" multiple="multiple">
		</div>
		
<div class="col-md-2 mb-3">
           <label for="nickname">이상형월드컵 참여여부</label>
		   <div class="form-check">
		  <input class="form-check-input" type="radio" name="gamereg" value="o" checked>
		  <label class="form-check-label" for="flexRadioDefault1">
		    예
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="gamereg" value="x">
		  <label class="form-check-label" for="flexRadioDefault2">
		    아니요
		  </label>
		</div>
		</div>
		
		
		
	<div class="col-md-4 mb-3">
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">이상형월드컵 목적</label>
	  <select class="form-select" id="purpose" name="purpose">
	    <option value="1">산책</option>
	    <option value="2">데이트</option>
	    <option value="3">둘다</option>
	  </select>
	</div>	
          </div>
		
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
</div>





  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
      
  </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>