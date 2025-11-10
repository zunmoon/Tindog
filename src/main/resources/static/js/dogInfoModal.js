// 모달 이미지 클릭 시 이벤트 처리

var body=document.querySelector('body');
var modalImg = document.querySelector('.card-img-top');
var modal = document.getElementById('dogInfoModal');
var closeBtn = document.getElementsByClassName('modal-close')[0];

modalImg.addEventListener('click', () => {
        modal.style.display='block';       
        body.style.overflow='hidden';    
});   

// 모달 닫기 버튼 클릭 시 이벤트 처리
closeBtn.addEventListener('click',() => {
		  modal.style.display='none';
		  body.style.overflow='auto'
});

// 모달 외부 영역 클릭 시 모달 닫기
window.addEventListener('click',(e) => {
		  if(e.target===modal){
			  modal.style.display='none';
			  body.style.overflow='auto'          	  
		  }
});  
 
	  
	  
	  
	  
	  
	  