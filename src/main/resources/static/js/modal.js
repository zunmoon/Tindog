    var body = document.querySelector('body');
    var btnOpenPopup = document.querySelector('.btn-open-popup');
    var modal = document.getElementById('worldcupmodal');
	var closeModalBtn=document.getElementById('closeModalBtn');

      btnOpenPopup.addEventListener('click', () => {
         modal.style.display='block';       
         body.style.overflow='hidden';    
      });   
      
      closeModalBtn.addEventListener('click',() => {
		  modal.style.display='none';
		  body.style.overflow='auto'
	  });
	  
	  window.addEventListener('click',(e) => {
		  if(e.target===modal){
			  modal.style.display='none';
			  body.style.overflow='auto'          	  
		  }
	  });     
    