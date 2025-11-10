package kr.co.tindog.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.tindog.member.UserDTO;

@Repository
public class ProductDAO {

	public ProductDAO() {
		System.out.println("ProductDAO()객체 생성됨");
	}//end
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("product.insert", map);
	}//insert() end
	
	
	public List<Map<String, Object>> list(){
		return sqlSession.selectList("product.list");
	}//list() end
	
	public List<Map<String, Object>> search(String subject){
		return sqlSession.selectList("product.search", "%" + subject + "%");
	}
	
	public Map<String, Object> detail(int uproduct_no){
        return sqlSession.selectOne("product.detail", uproduct_no);
    }//detail() end
	
	public String mainphoto(int uproduct_no) {
    	
    	return sqlSession.selectOne("product.mainphoto", uproduct_no);
    }//MAINPHOTO() end
	
   public String photo(int uproduct_no) {
    	
    	return sqlSession.selectOne("product.photo", uproduct_no);
    }//PHOTO() end
	
	
	 public void delete(int uproduct_no) {
	    	sqlSession.delete("product.delete", uproduct_no);
	    	
	    }//delete() end
	 

		public void update(Map<String, Object> map) {
			
			sqlSession.update("product.update", map); 
			
		}//update() end

		public String userphoto(String nickname) {
		    return sqlSession.selectOne("product.userphoto", nickname);
		}
		
		
	
}//class end
