package kr.co.tindog.wishlist;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository


public class WishlistDAO {
	
     public WishlistDAO() {
    	 System.out.println("WishlistDAO() 객체 생성됨");
     }
     
     @Autowired 
     SqlSession sqlSession;
	 
	 public int wishlistInsert(WishlistDTO dto) {
		 return sqlSession.insert("wishlist.insert", dto);
	 }//insert end
	 
	 public List<WishlistDTO> wishlistList(String email){
		 return sqlSession.selectList("wishlist.list", email);
	 }//list end
	 
	 
	 public int WishlistDelete(HashMap<String, Object> map){
			
			return sqlSession.delete("wishlist.delete", map);   
		}
	
}
