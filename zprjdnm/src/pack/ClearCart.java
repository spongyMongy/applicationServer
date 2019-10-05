
package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ClearCart extends HttpServlet {
    
	 private static final long serialVersionUID = 1L;
	    Statement stmt = null;
	   
	   PreparedStatement ps = null;
	   ResultSet rs = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	 Dbclass dbase= new Dbclass();
     	 dbase.getConnection();
    	 String ClearAll= request.getParameter("ClearAll");
         Integer ClearAll_int=Integer.parseInt(ClearAll);
        
            try {
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        		 } catch(Exception e) {}
        		 
        	      
                      String sql = "Select * from basket where user_id=?"; 
                      PreparedStatement psmclear =dbase.getConnection().prepareStatement(sql);
                      psmclear.setInt(1, ClearAll_int);   
                      //clearing the cart if not empty
                      ResultSet rs = psmclear.executeQuery();
                        if(rs.next()){
                            
                            stmt = dbase.getConnection().createStatement();        	      
                            stmt.executeUpdate("delete from basket where user_id="+ClearAll_int+";");
                            response.sendRedirect("userPage.jsp");
                        }
                        else {
                            response.sendRedirect("userPage.jsp");
                        }
		
		
            }catch( Exception ex){
                   ex.printStackTrace();
            }
        
		
                
      
    }

}
