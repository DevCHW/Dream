package hgb.address.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hgb.address.model.AddressDAO;
import hgb.address.model.AddressDTO;
import hgb.address.model.InterAddressDAO;



public class AddressRegisterController extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {	
		//  GET 방식이라면
		//	super.setRedirect(false);	
			super.setViewPage("/WEB-INF/view/member/address.jsp");
		}
		
		else {
			 // POST 방식이라면(즉, 저장하기 버튼을 클릭한 경우)
			 String order_name = request.getParameter("order_name"); 			 
			 String mobile = request.getParameter("mobile"); 
			 String post_code = request.getParameter("post_code"); 
			 String address = request.getParameter("address"); 	         
	         String detail_address = request.getParameter("detail_address"); 	         	         	         	         
	         
             AddressDTO address1 = new AddressDTO(order_name, mobile, post_code, address, detail_address);
	         
	         InterAddressDAO adao = new AddressDAO();
	         
			
	         try {
	        	 int n = adao.registerAddress(address1);
	        	 
	        	 if(n==1) {
	        		 String message = "회원가입 성공";
	        		 String loc = request.getContextPath()+"/index.up"; // 시작페이지로 이동한다.
	        		 
	        		 request.setAttribute("message", message);
	        		 request.setAttribute("loc", loc);
	        		 
	        	 	 super.setRedirect(true);
	        		 super.setViewPage("/WEB-INF/view/member/address.jsp");
	        	 }
	        	 
	         } catch(SQLException e) {
	        	e.printStackTrace();
	 			super.setRedirect(false);
	 			super.setViewPage(request.getContextPath()+"/WEB-INF/view/member/address.jsp"); 
	         }
			
			
			
		}
		
		
	}

}