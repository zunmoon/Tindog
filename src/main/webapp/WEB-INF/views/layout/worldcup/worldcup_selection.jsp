<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>

<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 400px; margin-top: 100px;">
				<!--<p class="d-inline-block border rounded-pill py-1 px-4" style="color: black;">이상형 강아지 선택하기</p>-->
               <p><button class="btn btn-dark btn-lg disabled">이상형 강아지 선택하기</button></p>
 </div>



<style>

     table, td { 
                 border-collapse: collapse;
                 border-left:none;
                 border-right:none;
                 text-align:center; 
                 font-size:20px;
     
     
     
      }

</style>


     <table>
	   <tr>
		<td>
		<form action="">
		<p class="d-inline-block border rounded-pill py-1 px-4" style="color: black;">나잇대</p>
        <fieldset>
        
           
            <label><input type="radio" name="radio">0-2</label>
            <label><input type="radio" name="radio">2-4</label>
            <label><input type="radio" name="radio">4-6</label>
            <label><input type="radio" name="radio">6년이상</label>
        </fieldset>
        </form>
		</td>
		</tr>
	</table>



    <table>
	   <tr>
		<td>
		<form action="">
        <fieldset>
           <legend>목적</legend>
            <select id="purpose">
              <option value="p1">산책친구</option>
              <option value="p2">데이트</option>
              <option value="p3">둘 다</option>
            </select>
        </fieldset>
        </form>
		</td>
		
		<td>
		<form action="">
        <fieldset>
           <legend>사이즈</legend>
            <select id="si">
              <option value="si1">소형견</option>
              <option value="si2">중형견</option>
              <option value="si3">대형견</option>
            </select>
        </fieldset>
        </form>
		</td>
		
		<td>
		<form action="">
        <fieldset>
           <legend>지역</legend>
            <select id="area">
              <option value="a1">서울/경기</option> 
              <option value="a2">강원권</option>   
              <option value="a3">충청권</option>   
              <option value="a4">영남권</option>   
              <option value="a5">호남권</option>
              <option value="a6">기타</option>
            </select>
        </fieldset>
        </form>
		</td>
		
		<td>
		<form action="">
        <fieldset>
           <legend>성별</legend>
            <select id="se">
              <option value="se1">남</option>
              <option value="se2">여</option>
              <option value="se3">상관없음</option>
            </select>
        </fieldset>
        </form>
		</td>
		
		<td>
		<form action="">
        <fieldset>
           <legend>중성화</legend>
            <select id="ne">
              <option value="ne1">중성화 O</option>
              <option value="ne2">중성화 X</option>
              <option value="ne3">상관없음</option>
            </select>
        </fieldset>
        </form>
		</td>
			
	</tr>
   </table>



<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 400px; margin-top: 100px;">
               <p><button class="btn btn-dark btn-lg" onclick="location.href='/worldcup/start'">이상형 월드컵 시작하기>></button></p>
 </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>