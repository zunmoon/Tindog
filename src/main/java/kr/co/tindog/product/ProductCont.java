package kr.co.tindog.product;

import java.io.File;
import java.net.URI;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.ui.Model;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.tindog.product.ProductDAO;
import kr.co.tindog.wishlist.WishlistDTO;


@Controller

public class ProductCont {
       
	
	public ProductCont() {
		System.out.println("ProductCont생성됨");
	}//class end
	
	@Autowired
	ProductDAO productDao;	
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/list");
	    mav.addObject("list", productDao.list());
		return mav;
	}//list() end
	
	
	@GetMapping("/write")
	public String write(Model model, HttpSession session) {
		
		String s_nickname = (String) session.getAttribute("s_nickname");
        model.addAttribute("s_nickname", s_nickname);
       
        
		return "product/write";
	}//write() end 
	
	
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
			             @RequestParam MultipartFile img1,
			                           MultipartFile img2,
			             HttpServletRequest req,
			             HttpSession session) {
		
		String mainphoto = "-";
		String photo = "-";
		
		if(img1 != null && !img1.isEmpty()) { 
			mainphoto=img1.getOriginalFilename(); 
			
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				img1.transferTo(new File(path + "\\" + mainphoto));
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		if(img2 != null && !img2.isEmpty()) {
			photo=img2.getOriginalFilename();
			
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				img2.transferTo(new File(path + "\\" +photo));
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		
		String s_nickname = (String) session.getAttribute("s_nickname");
		
		
		map.put("s_nickname", s_nickname);
		map.put("mainphoto", mainphoto);
		map.put("photo", photo);
		
		
		productDao.insert(map); 

		
		
		return "redirect:/list"; 
	}//insert() end
	
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue = "") String subject){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", productDao.search(subject));
		mav.addObject("subject", subject);
		return mav;
	}//search() end
	
	@GetMapping("/detail/{uproduct_no}")
	public ModelAndView detail(@PathVariable int uproduct_no,
			                             HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/detail");
		
		 String Seller = (String) session.getAttribute("s_nickname");

		    // 글 상세 정보 조회
		    Map<String, Object> detail = productDao.detail(uproduct_no);

		    // 글을 작성한 사용자 정보 가져오기
		    String author = (String) detail.get("NICKNAME");
		    
		    // 작성자의 사진 가져오기
		    String userphoto = productDao.userphoto(author);
		   
		    // 세션에 저장된 사용자와 글을 작성한 사용자가 같은지 비교
		    boolean isAuthor = Seller != null && Seller.equals(author);	    
		    
		    // 수정, 삭제 권한 여부를 View에 전달
		    mav.addObject("isAuthor", isAuthor);
		    mav.addObject("product", detail);
		    mav.addObject("userphoto", userphoto);
		    mav.addObject("product", productDao.detail(uproduct_no));
		    		  
		    if (isAuthor) {
		        // 판매자일 경우
		        // 판매자에게 보여질 데이터를 설정
		        mav.addObject("isSeller", true);
		        mav.addObject("product", detail);
		    } else {
		        // 구매자일 경우
		        // 구매자에게 보여질 데이터를 설정
		        mav.addObject("isSeller", false);
		        mav.addObject("product", detail);
		    }
		    
		  
		return mav;
		
		 
		
	}//detail() end
	
	@PostMapping("/delete")
	public String delete(HttpServletRequest req) {
		int uproduct_no = Integer.parseInt(req.getParameter("uproduct_no")); 
		
		//삭제하고자 하는 파일명 가져오기
		   String mainphoto=productDao.mainphoto(uproduct_no);
		   String photo=productDao.photo(uproduct_no);
		   
		   //첨부된 파일 삭제하기
		   if(mainphoto != null && !mainphoto.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");
			File file1 = new File(path + "\\" + mainphoto);
			
		  }//if end 
		 
		   if(photo != null && !photo.equals("-")) {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				File file2 = new File(path + "\\" + photo);
				
			  }//if end 
	
		   
		productDao.delete(uproduct_no);   
			  
		return "redirect:/list"; 
			 
	}//delete() end
	
	
	 @PostMapping("/update")
	   public String update(@RequestParam Map<String, Object> map,
	             @RequestParam MultipartFile img1, 
	                           MultipartFile img2,
	                           
	             HttpServletRequest req) {
		   
		   String mainphoto = "-";
		   String photo = "-";
		   System.out.println(map.get("uproduct_no"));
			
			if(img1 != null && !img1.isEmpty()) { //파일이 존재한다면
				mainphoto=img1.getOriginalFilename();
				try {
					ServletContext application = req.getSession().getServletContext();
					String path = application.getRealPath("/storage"); //실제경로
					img1.transferTo(new File(path + "\\" + mainphoto));  //파일저장
				}catch(Exception e) {
					System.out.println(e);
				}//try end
			}else{ //첨부된 파일이 없다면
			    int uproduct_no=Integer.parseInt(map.get("uproduct_no").toString());
				Map<String, Object> oldProduct=productDao.detail(uproduct_no);
				mainphoto=oldProduct.get("MAINPHOTO").toString();
				
			}//if end 
			
			if(img2 != null && !img2.isEmpty()) { //파일이 존재한다면
				photo=img2.getOriginalFilename();
				try {
					ServletContext application = req.getSession().getServletContext();
					String path = application.getRealPath("/storage"); //실제경로
					img2.transferTo(new File(path + "\\" + photo));  //파일저장
				}catch(Exception e) {
					System.out.println(e);
				}//try end
			}else{ //첨부된 파일이 없다면
			    int uproduct_no=Integer.parseInt(map.get("uproduct_no").toString());
				Map<String, Object> oldProduct=productDao.detail(uproduct_no);
				photo=oldProduct.get("PHOTO").toString();
		
			}//if end 
			
			
			
			map.put("mainphoto", mainphoto);
			map.put("photo", photo); 
			productDao.update(map); 
			return "redirect:/list"; 
		   
		   
	   }//update() end
	
	
	
	
}
