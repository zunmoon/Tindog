//개껌페이 모달창
    var payBody = document.querySelector('body');
    var openPayPopup = document.querySelector('.open-pay-popup');
    var payModal = document.getElementById('pay-modal');
	var payClose=document.getElementById('close-pay-btn');

      openPayPopup.addEventListener('click', () => {
         payModal.style.display='block';       
         payBody.style.overflow='hidden';    
      });   
      
      payClose.addEventListener('click',() => {
		  payModal.style.display='none';
		  payBody.style.overflow='auto'
	  });
	  
	  window.addEventListener('click',(e) => {
		  if(e.target===modal){
			  payModal.style.display='none';
			  payBody.style.overflow='auto'          	  
		  }
	  });     
    