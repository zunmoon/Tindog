<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>


<br>
<br>
<br>

<div class="container">
<div class="row">
<input type="hidden" name="nickname" id="nickname" value="${nickname}">
    	<!-- varStatus="상태용 변수" -->
		<c:forEach items="${list}" var="row" varStatus="vs">
		
			<div class="col-sm-4 col-md-4">
				<c:choose>
					<c:when test="${row.MAINPHOTO != '-'}">
						
							<img src="/storage/${row.MAINPHOTO}" class="img-responsive margin" style="width:100%; height:60%" >
						
					</c:when>
					<c:otherwise>
						등록된 사진 없음!!<br>
					</c:otherwise>
				</c:choose>
				<br>
   							
				<a href="<%= request.getContextPath() %>/detail/${row.UPRODUCT_NO}"">${row.SUBJECT}</a>
									
				<br>
				<fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>원
				<br>
				${row.AREA}
				<br>
				판매상태 : ${row.STATUS_TEXT}
				
			</div>
            <!-- 한줄에 3칸씩 -->
            <c:if test="${vs.count mod 3==0}">
               
                <div style="height: 50px;"></div>
           
           </c:if>
             
		</c:forEach>		   	 
  </div><!-- row end -->
 
  <!-- 댓글 시작 -->
  <div class="row">
    <div class="col-sm-12">
     <form name="hoogiInsertForm" id="hoogiInsertForm">
     <!-- 부모글 번호 -->
     <input type="hidden" name="nickname" id="nickname" value="${nickname}">
     <table class="table table-borderless">
	<tr>
		<td>
			<input type="text" name="context" id="context" placeholder="후기를 등록해보세요" class="form-control">
		</td>
		<td>
			<button type="button"  name="hoogiInsertBtn" id="hoogiInsertBtn" class="btn btn-secondary">후기 쓰기</button>
		</td>
		</table>
     </form>
     </div><!-- col end -->
   </div><!-- row end -->
  
   <div class="row">
    <div class="col-sm-12"><!-- 댓글목록 -->
    <div class="hoogiList"></div>
    </div><!-- col end -->
    </div><!-- row end -->
  <!-- 댓글 끝 -->
  
  </div>
  
  
  <!-- 댓글 관련 자바스크립트 -->
    <script>
    
    let s_nickname = '${s_nickname}'; //부모글번호
    let nickname = '${nickname}';
    
    $(document).ready(function(){ //페이지 로딩시 댓글 목록 출력
    	hoogiList();
    });//ready() end
    
    
    
    //댓글등록 버튼을 클릭했을때
    $("#hoogiInsertBtn").click(function(){
        //alert($); 
        let context = $("#context").val();
        context = context.trim();
        
        
        if(context.length==0){
        	alert("후기를 등록해 주세요");
          $("#context").focus();	
        }else{//<form if="commentInsertForm"></form>의 컨트롤 요소를 모두 가져오기
        
       let insertData = $("#hoogiInsertForm").serialize();
       let s_nickname = '${s_nickname}'; 
      
       hoogiInsert(insertData); //댓글등록 함수 호출
          	
      }//if end
    }); //click end
    
    function hoogiInsert(insertData){//댓글등록 함수}
    
	  // alert("댓글등록함수호출:" + insertData);
	    $.ajax({
	        url: '/hoogi/insert'  //요청 명령어
	       ,type: 'post'
	       ,data: insertData        //전달값
	       ,error: function(xhr, status, error){
	    	   alert("에러발생 :" + error);
	       }//error end
	      
	       ,success: function(result){
	    	 //  alert(data); //1이 alert 됨
	    	 if(result==1){ //댓글 등록에 성공하면
	    		 alert("후기가 등록되었습니다");
	    		 hoogiList(); //댓글등록 후 함수호출
	    		 $("#context").val('');//기존 댓글내용을 빈 문자열로 대입(호출)
	    	 }//if end
	      }//success end   
	    
	    }); //ajax() end
	
	}//commentInsert() end
    
	function hoogiList(){
		// alert("댓글목록 함수 호출");
		$.ajax({
			 url: '/hoogi/list'
			,type: 'get'
			,data: {'nickname' : nickname}
			,error: function(error){
				alert(error);
			//	console.log(error);
			}//error end
			,success: function(result){
			//	alert(result);
			//	console.log(result);
			 let a=''; //출력할 결과물을 a 변수에 모은다
			 $.each(result, function(key, value){
			    //console.log(key);           //순서 0 1 2
				// console.log(value);         //[oject object]
				//console.log(value.cno);
				//console.log(value.content);
				//console.log(value.wname);
				//console.log(value.regdate);
		 		//console.log(value.product_code);
			
		   a += '<div class="hoogiArea" style="border-bottom:1px solid darkgray; margin-bottom:15px"> ';		
		   a += '      <div class="hoogiInfo' + value.review_no + '">';
		   a += '    댓글번호:' + value.review_no + ' / 작성자:' + value.consumer + ' / ' + value.regdate;
		   a += '     <a href="javascript:hoogiUpdate(' + value.review_no +',\'' + value.context + '\')">[수정]</a>';
		   a += '     <a href="javascript:hoogiDelete(' + value.review_no + ')">[삭제]</a>';
		   a += '      </div>';
		   a += '      <div class="hoogiContext' + value.review_no + '">';
		   a += '    <p>내용:' + value.context + '</p>';
		   a += '      </div>';
		   a += '</div>';
			 
	    });//each() end  //반복문
	    
	    $(".hoogiList").html(a);
	    
	  }//success end
	}); //ajax() end
}//commentList() end


     //댓글수정 - 댓글내용을 텍스트박스(input type=text)에 옮겨 담아서 출력
     function hoogiUpdate(review_no, context){
	     //alert(cno + content);
	    let a=''; 
	    a += '<div class="input-group">'; 
	    a += '    <input type="text" value="' + context +'" id="context_' + review_no + '">';
	    a += '    <button type="button" onclick="hoogiUpdateProc(' + review_no + ')">수정</button>'
	    a += '</div>';
	    // alert(a);
	    $(".hoogiContext" + review_no).html(a);
	     
  }//commentUpdate
  
    function hoogiUpdateProc(review_no){
	  //alert("댓글수정"+cno);
	  let updateContext = $("#context_" + review_no).val();
	  //alert(updateContent);
	  
	  $.ajax({
		  url:'/hoogi/update'
		, type:'post'
		, data:{'review_no':review_no, 'context':updateContext}//"cno="+cno+"&content="+updateContent
	    , success:function(result){ 
	        if(result==1){
	        	alert("댓글이 수정되었습니다");
	        	hoogiList(); //댓글 수정  후 목록 출력
	        	
	        }else{
	        	alert("본인의 글이 아닌 후기는 수정하실 수 없습니다");
	        }//if end
	    		    	
	    }//success end
	  });//ajax() end
	  
	  
  }//commentUpdateProc() end
  
  function hoogiDelete(review_no){
	  //alert("댓글삭제" + cno);
	  $.ajax({
		  url:'/hoogi/delete/' + review_no   //RESTful방식으로 웹서비스 요청. 예)/comment/delete/5
		, type:'post'
		, data:{'review_no':review_no}
	    , success:function(result){ 
	        if(result==1){
	        	alert("댓글이 삭제되었습니다");
	        	hoogiList(); //댓글 수정  후 목록 출력
	        }else{
	        	alert("본인의 글이 아닌 후기는 삭제하실 수 없습니다");
	        }//if end
	    }//success end
	  });//ajax() end
  }//commentDelete() end
  
  
  
    </script>  

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html> 