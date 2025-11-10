<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
#rank-img > img{
	height: 300px;
	width : 300px;
}


        .slider{
            accent-color:#11aaf1;
           width:300px
        }
 	datalist{
            display: grid;
            grid-auto-flow: column;
            width:313px;
        }


</style>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/sessionHeaderAlert.jsp"></jsp:include>
		
<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; margin-top: 50px !important;" >
           <img src="/img/강아지이상형월드컵.png">
       </div>
				<!-- 주간 인기 댕댕이 시작 -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <p class="d-inline-block border rounded-pill py-1 px-4">Top 4</p>
                <h1 style="font-size:30px; margin-top: 30px;">주간 인기 댕댕이🐶</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="img/dog1.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>꾸꾸</h5>
                            <p class="text-primary">골든리트리버/1살</p>                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="img/dog2.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>꽁이</h5>
                            <p class="text-primary">포메라이언/2살</p>                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="img/dog3.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>릴리</h5>
                            <p class="text-primary">말티즈/5살</p>                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="img/dog4.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>새침이</h5>
                            <p class="text-primary">3살/비글</p>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 주간 인기 댕댕이 끝  -->

<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
		<button id="btn" class="btn-open-popup" style="display:inline-block; background-color: white; border:none;"><img src="img/btn_이상형강아지등록.png"></button>
		<a href="worldcup/start" style="display:inline-block;"><img src="img/btn_이상형월드컵시작.png"></a>
	</div>

	<div class="worldcupmodal" id="worldcupmodal">
   	<div class="modal_content">	
	<form name="worldcupForm" method="post"  action="worldcup/optionstart">
	
	<div class="option_nav">
		<div class="nav_header">
			<h4 class="nav_title">
				<span>상세검색</span>
			</h4>		
		</div>
		<div class="spec_list">					
			<div>
				<div class="spec_name">		
					나이	
				</div>
				<div class="spec_content">					
					    <input id="age" class="slider" name="age" type="range" min="0" max="15" list="tickmarks"><br>
		    <datalist id="tickmarks">
		        <option value="0" style="position: relative; left: 7px;">0</option>
		        <option value="1" style="position: relative; left: 9px;">1</option>
		        <option value="2" style="position: relative; left: 10px;">2</option> 
		        <option value="3" style="position: relative; left: 12px;">3</option>
		        <option value="4" style="position: relative; left: 12px;">4</option>
		        <option value="5" style="position: relative; left: 14px;">5</option>
		        <option value="6" style="position: relative; left: 15px;">6</option>
		        <option value="7" style="position: relative; left: 16px;">7</option>
		        <option value="8" style="position: relative; left: 16px;">8</option>
		        <option value="9" style="position: relative; left: 16px;">9</option>
		        <option value="10" style="position: relative; left: 15px;">10</option>
		        <option value="11" style="position: relative; left: 13px;">11</option>
		        <option value="12" style="position: relative; left: 10px;">12</option>
		        <option value="13" style="position: relative; left: 7px;">13</option>
		        <option value="14" style="position: relative; left: 5px;">14</option>
		        <option value="15" style="position: relative; left: 1px;">15</option>
		    </datalist>
				</div>	
			</div>	
			<div>
				<div class="spec_name">	
					목적	
				</div>		
				<div class="spec_content">
					<label title="산책친구">
						<input type="radio" autocomplete="off" id="walk" name="purpose" value=1>
						산책친구
					</label>
					<label title="데이트">
						<input type="radio" autocomplete="off" id="purpose" name="purpose" value=2>
						데이트								
					</label>
				</div>
			</div>
			<div>
				<div class="spec_name">					
					사이즈
				</div>
				<div class="spec_content">
					<label title="사이즈">
						<input type="radio" autocomplete="off" id="small" name="size" value=1>
						소형견
					</label>
					<label title="사이즈">	
						<input type="radio" autocomplete="off" id="mid" name="size" value=2>
						중형견
					</label>
					<label title="사이즈">	
						<input type="radio" autocomplete="off" id="big" name="size" value=3>
						대형견								
					</label>
				</div>
			</div>
			<div>
				<div class="spec_name">
					성별
				</div>
				<div class="spec_content">	
					<label title="성별">
						<input type="radio" autocomplete="off" id="boy" name="sex" value="M">
						남
					</label>
					<label title="성별">
						<input type="radio" autocomplete="off" id="lady" name="sex" value="F">
						여													
					</label>
				</div>
			</div>
			<div>
				<div class="spec_name">					
					중성화
				</div>
				<div class="spec_content">					
					<label title="중성화">
						<input type="radio" autocomplete="off" id="sad" name="neutral" value="o">
						 O
					</label>
					<label title="중성화">
						<input type="radio" autocomplete="off" id="happy" name="neutral" value="x">
						 X													
					</label>
				</div>
			</div>
		</div>
	</div>
	<span class="close" id="closeModalBtn"> X </span>   

	<div id="submit" style="margin-top: 35px"> 
		<input type="image" src="/img/btn_이상형월드컵시작.png">
		<!-- <img src="/img/btn_이상형월드컵시작.png" class="btn" onclick="location.href='worldcup/optionstart'"> -->
	</div>
	</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>