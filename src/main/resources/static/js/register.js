	var regiBody = document.querySelector('body');
  		
  		
  	//이메일 모달 띄우기 
  		function remailCheck(){
		
			 var openEmailPopup = document.querySelector('#email');
			 var emailModal = document.getElementById('email-check-modal');
			 var emailCheckClose=document.getElementById('email-check-btn');

				openEmailPopup.addEventListener('click', () => {
					emailModal.style.display='block';       
   
			    });   
			    
				emailCheckClose.addEventListener('click',() => {
					emailModal.style.display='none';
					  regiBody.style.overflow='auto'
				  });
				  
				  window.addEventListener('click',(e) => {
					  if(e.target===modal){
						  emailModal.style.display='none';
						  regiBody.style.overflow='auto'          	  
					  }
				  });  
			
			
		/* 모달 띄우기 끝 */
		
		  document.querySelector("#email2").addEventListener("input", function(){
		let inputEmail=this.value;
		if(inputEmail.trim().length==0){
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			return;
		}
		
		const regEx=/^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/
		
		if(regEx.test(inputEmail)){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			checkObj.emailValid=true;			
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			checkObj.emailValid=false;			
		}
	});	 
		
		}
 		
 		
 		/* 중복 확인 AJAX */
  		$("#email-check-btn").click(function(){
  			//alert("clicked");
  			//$.post("요청명령어", 전달값, callback함수);
  		$.post("register/emailDupCheck"						    //요청명령	
  				,"email=" + $("#email2").val().trim() //전달값(변수=값&변수=값)
  				,emailResponseProc						    //콜백함수
  				);
  		});//click end
  		
  	 	function emailResponseProc(result){ //result:서버가 응답해준 
  			//alert(result);
  		
	   	 	var rEmail = result.email;
	   	    var result = result.result;
			
  			if(result==1){
  				swal({
  		        	title:"사용 가능한 이메일 입니다.",
  		        	icon:"success",
  		        	confirmButtonText:"확인",
  		        	closeOnClickOutside:false,
  		        	closeOnEsc:false,        	        	
  		        })
  		     $("#email-check-modal").css("display", "none");
  	        // 입력창에 받은 닉네임을 설정합니다.
  	        $("#email").val(rEmail);
  			}else{
  				
  				alert("이미 사용중인 이메일 입니다");
  			}
  			
  		}//responseProc()end
  		
  		
  		
  		
  		
  		
  		/* 닉네임 모달 띄우기 */
		function nickCheck() {
			
			 var openNickPopup = document.querySelector('#nickname');
			 var nickModal = document.getElementById('nick-check-modal');
			 var nickCheckClose=document.getElementById('nick-check-close');

				openNickPopup.addEventListener('click', () => {
					nickModal.style.display='block';       
    
			    });   
			    
				nickCheckClose.addEventListener('click',() => {
					nickModal.style.display='none';
					  regiBody.style.overflow='auto'
				  });
				  
				  window.addEventListener('click',(e) => {
					  if(e.target===modal){
						  nickModal.style.display='none';
						  regiBody.style.overflow='auto'          	  
					  }
				  });  
			
			//window.open("register/nickCheck", "idwin", "width=400, height=200, left="+popX+", top="+popY);
		/* 모달 띄우기 끝 */
		
		    document.querySelector("#nickname2").addEventListener("input", function(){
				let inputNick=this.value;
				if(inputNick.trim().length==0){
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
					return;
				}
				
				const regEx=/^[A-Za-z가-힣0-9]{2,10}$/
				
				if(regEx.test(inputNick)){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
					checkObj.nickValid=true;
				}else{
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
					checkObj.nickValid=false;
				}
			});    
		
		}
  		
  		
  		/* 중복 확인 AJAX */
   		$("#nick-check-btn").click(function(){
   			//alert("clicked");
   			//$.post("요청명령어", 전달값, callback함수);
   		$.post("register/nickDupCheck"						    //요청명령	
   				,"nickname=" + $("#nickname2").val().trim() //전달값(변수=값&변수=값)
   				,responseProc						    //콜백함수
   				);
   		});//click end
   		
   	 	function responseProc(result){ //result:서버가 응답해준 
   			//alert(result);
   		
	   	 	var rNickname = result.nickname;
	   	    var result = result.result;
			
   			if(result==1){
   				swal({
   		        	title:"사용 가능한 닉네임 입니다.",
   		        	icon:"success",
   		        	confirmButtonText:"확인",
   		        	closeOnClickOutside:false,
   		        	closeOnEsc:false,        	        	
   		        })
   		     $("#nick-check-modal").css("display", "none");
   	        // 입력창에 받은 닉네임을 설정합니다.
   	        $("#nickname").val(rNickname);
   			}else{
   				
   				alert("이미 사용중인 닉네임 입니다");
   			}
   			
   		}//responseProc()end	
	
	
	
	
		const checkObj={
			"nameValid":false
			,"nickValid":false			
			,"emailValid":false
			,"pwValid":false
			,"pwCheckValid":false
			,"detailaddr":false
			,"userphotofile":false
			,"dnameValid":false
			,"dageValid":false
			,"weightValid":false
		}
		
		document.querySelector("#name").addEventListener("input", function(){
			let inputName=this.value;
			if(inputName.trim().length==0){
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				return;
			}
			
			const regEx=/^[가-힣]{2,4}$/
			
			if(regEx.test(inputName)){
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");
				checkObj.nameValid=true;
			}else{
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				checkObj.nameValid=false;
			}
		});
		
		document.querySelector("#nickname").addEventListener("input", function(){
			let inputNick=this.value;
			if(inputNick.trim().length==0){
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				return;
			}
			
			const regEx=/^[A-Za-z가-힣0-9]{2,10}$/
			
			if(regEx.test(inputNick)){
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");
				checkObj.nickValid=true;
			}else{
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				checkObj.nickValid=false;
			}
		});
		
		document.querySelector("#password").addEventListener("input", function(){
			let inputPw=this.value;			
			if(inputPw.trim().length==0){
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				return;
			}
			
			const regEx=/^[A-Za-z0-9\!\@\#\-\_]{6,20}$/
			
			if(regEx.test(inputPw)){				
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");
				checkObj.pwValid=true;
			}else{
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				checkObj.pwValid=false;
			}			
		});
		
		document.querySelector("#repasswd").addEventListener("input", function(){
			let inputPwCheck=this.value;
			if(inputPwCheck.trim().length==0){
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");				
			}
						
				if(inputPwCheck==password.value){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
					checkObj.pwCheckValid=true;
				}else{
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
					checkObj.pwCheckValid=false;
				}
			
		});
		
		document.querySelector("#email").addEventListener("input", function(){
			let inputEmail=this.value;
			if(inputEmail.trim().length==0){
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				return;
			}
			
			const regEx=/^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/
			
			if(regEx.test(inputEmail)){
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");
				checkObj.emailValid=true;
			}else{
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
				checkObj.emailValid=false;
			}
		});	
		
		document.querySelector("#detailaddr").addEventListener("input", function(){
			let inputDetailaddr=this.value;
			detailaddr=inputDetailaddr.length>0;
			if(detailaddr){
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");				
			}else{
				this.classList.remove("is-valid");
				this.classList.add("is-invalid");
			}
		})

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
	
		//유저사진 미리보기 
		const representativeImageInput = document.getElementById('userphotofile');
		const representativeImageContainer = document.getElementById('userPic_container');
		const representativeImage = document.getElementById('uDefault_image');
		
		representativeImageInput.addEventListener('change', (e) => {
			const file = e.target.files[0];
			const reader = new FileReader();
		
			reader.onload = function (event) {
				representativeImage.src = event.target.result;
			};
		
			if (file) {
				reader.readAsDataURL(file);
			} else {
				representativeImage.src = 'img/defaultImg.jpg'; // 기본 이미지로 설정
			}
		});
		
		//강아사진 미리보기 
		const userImageInput = document.getElementById('mainphotofile');
		const userImageContainer = document.getElementById('mainPic_container');
		const userImage = document.getElementById('mDefault_image');
		
		userImageInput.addEventListener('change', (e) => {
			const file = e.target.files[0];
			const reader = new FileReader();
		
			reader.onload = function (event) {
				userImage.src = event.target.result;
			};
		
			if (file) {
				reader.readAsDataURL(file);
			} else {
				userImage.src = 'img/defaultImg.jpg'; // 기본 이미지로 설정
			}
		});
		
		
		//생년월일 오늘 날짜로 셋팅  
		
		//현재 날짜를 가져오는 함수
		function getCurrentDate(){
			const now = new Date();
			const year = now.getFullYear();
			let month = (now.getMonth()+1).toString();
			let day = now.getDate().toString();
			
			//월과 일이 한자리 수인 경우 앞에 0을 붙여준다
			month = month.length === 1 ? '0' + month : 	month;
			day = day.length === 1? '0' + day : day; 
			
			return `${year}-${month}-${day}`;
		}
		 // 현재 날짜로 값을 설정하는 코드
		document.getElementById('birth').value = getCurrentDate();


	
	
	/*
	let tableCounter = 1; // 테이블 고유 ID를 위한 카운터
		
	function addDReg(){
		
		if(tableCounter < 3){
		
		tableCounter++; // 각 테이블마다 고유한 ID를 위해 증가
		
		var table = document.createElement('table');
        table.className = 'table';
        table.id = 'dogReg_' + tableCounter; // 고유한 ID 할당
		
		
		// 테이블에 필요한 내용 추가
		table.innerHTML = `
			
			<table class="table" id="dogReg1">
				<input type="hidden" name="dogorder" value="${tableCounter}">
			<tr>
			    <td style="text-align: center">
			    	강아지${tableCounter} 정보입력
			    </td>
			</tr>
			<tr>
			    <th style="width: 21%;">강아지 이름</th>
			    <td style="text-align: left">
			    	<input type="text" name="dname" id="dname" size="10" maxlength="10">
			    </td>
			</tr>
			<tr>
			    <th>강아지 나이</th>
			    <td style="text-align: left">
			    	<input type="number" name="age" id="age" size="1" maxlength="2">살
			    </td>
			</tr>
			<tr>
			    <th>성별</th>
			    <td style="text-align: left">
					<label>
						<input type="radio" name="sex" value="m">
						남아&nbsp;
					</label>
					<label>
						<input type="radio" name="sex" value="f">
						여아
					</label>
			    </td>
			</tr>
			    <th>중성화 여부</th>
			    <td style="text-align: left">
					<label>
						<input type="radio" name="neutral" value="o">
						예&nbsp;
					</label>
					<label>
						<input type="radio" name="neutral" value="x">
						아니오
					</label>
			    </td>
			</tr>
			<tr>
			    <th>무게</th>
			    <td style="text-align: left">
			    	<input type="text" name="weight" id="weight" size="10" maxlength="10">kg
			    </td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td style="text-align: left">
					<select id="size" name="size">
						<option value="1">소형견</option>
						<option value="2">중형견</option>
						<option value="3">대형견</option>
					</select>
				</td>
			</tr>
			<tr>
			<th>강아지 견종 </th>
				<td style="text-align: left">
					<select id="dogcd" name="dogcd">
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
				</td>
			</tr>
			<tr>
			  <th>대표사진등록</th>
			  <td style="text-align: left">
				<div id="image_container mainPic_container">
					 <img src="img/defaultImg.jpg" alt="기본 이미지" id="mDefault_image"  style="width: 50%" />
				</div>
				<input type="file" id="mainphoto" name="mainphoto" accept="image/*">
			  </td>
			</tr>
			<tr>
			  <th>기타사진등록</th>
			  <td style="text-align: left">
				<input type="file" id="dPic1" name="dPic1" accept="image/*">
				<input type="file" id="dPic2" name="dPic2" accept="image/*">
				<input type="file" id="dPic3" name="dPic3" accept="image/*">
			  </td>
			</tr>
			<tr>
			    <th>강아지 소개</th>
			    <td style="text-align: left">
			    	<textarea id="dog_detail" name="dog_detail" rows="4" cols="50"></textarea>
			    </td>
			</tr>
			<tr>
			    <th>이상형월드컵 등록</th>
			    <td style="text-align: left">
					<label>
						<input type="radio" name="gameReg" value="Y">
						예&nbsp;
					</label>
					<label>
						<input type="radio" name="gameReg" value="N">
						아니요
					</label>
			    </td>
			</tr>
			<tr>
				<th>이상형월드컵 목적</th>
				<td style="text-align: left">
					<select id="purpose" name="purpose">
						<option value="1">산책</option>
						<option value="2">데이트</option>
						<option value="3">둘다</option>
					</select>
				</td>
			</tr>
        `;
			
		
		const target = document.getElementById('appendHere');
		target.appendChild(table);
		
		}else{
			alert("최대 3마리까지 등록하실 수 있습니다");
		}
		
		
	}//addDReg end
	
	*/
		