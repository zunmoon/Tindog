    var bbody = document.querySelector('body');
    var OpenPopup = document.querySelector('.open-popup');
    var mmodal = document.getElementById('modal');
	var close=document.getElementById('closeModalBtn');

      OpenPopup.addEventListener('click', () => {
         mmodal.style.display='block';       
         bbody.style.overflow='hidden';    
      });   
      
      close.addEventListener('click',() => {
		  mmodal.style.display='none';
		  bbody.style.overflow='auto'
	  });
	  
	  window.addEventListener('click',(e) => {
		  if(e.target===modal){
			  mmodal.style.display='none';
			  bbody.style.overflow='auto'          	  
		  }
	  });     
    