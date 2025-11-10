<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body class="wrapper">

<div style="position: relative;">
<jsp:include page="/WEB-INF/views/common/mypageIndex.jsp"></jsp:include>
</div>
<div class="container">
<c:forEach var="item" items="${list}">	
		<div class="cont" style="position: absolute;">
		
		
		<div class="userInfoText">
			<div style="border-bottom: solid 1px darkgrey;"> 유저정보</div>
		</div>
		<div style="color: black;" class="userInfo text-center">
			<div id="image_container mainPic_container" style="margin-bottom: 5px;">
				 <c:choose>
            <c:when test="${item.userphoto eq 'PHOTO'}">
                <img src="img/defaultImg.jpg" alt="기본 이미지" id="userDefaultImg" style="width: 50%" />
            </c:when>
            <c:otherwise>
                <img src="/img/${item.userphoto}" id="userDefaultImg" alt="기본 이미지" style="width: 50%" />
            </c:otherwise>
       			 </c:choose>
			</div>
			<div class="">
			<form class="row g-3">
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">이름</label>
		    <input type="text" value="${item.name}(${item.sex eq 'f' ? '여' : '남'})" class="form-control" id="inputEmail4" readonly>
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">생년월일</label>
		    <input type="text" value="${item.birth}" class="form-control" id="inputPassword4" readonly>
		  </div>
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">이메일</label>
		    <input type="email" value="${item.email}" class="form-control" id="inputEmail4" readonly>
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">닉네임</label>
		    <input type="text" value="${item.nickname}" class="form-control" id="inputPassword4" readonly>
		  </div>
		  <div class="col-md-4">
		    <label for="inputCity" class="form-label">주소1</label>
		    <input type="text" value="${item.addr}" class="form-control" id="inputCity" readonly>
		  </div>
		  <div class="col-md-2">
		    <label for="inputState" class="form-label">주소2</label>
 			<input type="text" value="${item.detailaddr}" class="form-control" id="inputZip" readonly>
		  </div>
		  <div class="col-md-2">
		    <label for="inputZip" class="form-label">우편번호</label>
		    <input type="text" value="${item.post}" class="form-control" id="inputZip" readonly>
		  </div>
		</form>
		</div>
			
			
			<!-- 
			<table class="table" id="userInfo-table">
				<tr>
				    <th>이름</th>
				    <td style="text-align: left">
				    	${item.name} (${item.sex eq 'f' ? '여' : '남'})
				    </td>
				</tr>
				<tr>
				    <th>이메일</th>
				    <td style="text-align: left">
					${item.email}
				    </td>
				</tr>
				<tr>
				    <th>닉네임</th>
				    <td style="text-align: left">
				    ${item.nickname}
				    </td>
				</tr>
				<tr>
				    <th>생년월일</th>
				    <td style="text-align: left">
				    	${item.birth}
				    </td>
				</tr>
				<tr>
				    <th>주소</th>
				    <td style="text-align: left">
				    	${item.addr} ${item.detailaddr} (${item.post})
				    </td>
				</tr>
			</table>
			 -->
			</div>
		</div>
		</c:forEach>
</div>
<div style="margin-top: 400px">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>
    