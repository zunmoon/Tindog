//	네이버아이디로로그인 초기화 Script
	var naver_id_login = new naver_id_login("5umZ6__Lhex2mo0Zq_EH", "http://localhost:2000");
	var state = naver_id_login.getUniqState();
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
//	네이버아이디로로그인 초기화 Script 

//	네이버아이디로로그인 Callback페이지 처리 Script
	
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");

//	네이버아디디로로그인 Callback페이지 처리 Script