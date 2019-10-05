package pack;

import java.io.IOException;
import static java.lang.System.out;
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


public class DeleteBook extends HttpServlet {
    
	 
	   private static final long serialVersionUID = 1L;  
	   Statement stmt = null;
	   PreparedStatement ps = null;
	   ResultSet rs = null;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	 Dbclass dbase= new Dbclass();
     	 dbase.getConnection();
    	
    	String id = request.getParameter("id");
        
        int id_int = Integer.parseInt(id);
        
		try {
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        		 } catch(Exception e) {
        			
        		 }
        		 
                      String sql = "Select * from book where book_id=?"; 
                      PreparedStatement psm = dbase.getConnection().prepareStatement(sql);
                      psm.setInt(1, id_int);  
                     
                      //deleting book from the cart
                      ResultSet rs = psm.executeQuery();
                        if(rs.next()){
                            
                            stmt = dbase.getConnection().createStatement();        	      
                            stmt.executeUpdate("delete from book where book_id="+id_int+";");
                            response.sendRedirect("adminPage.jsp");
                        }
                        else {
                            response.sendRedirect("adminPage.jsp");
                        }
		
		
            }catch(Exception ex){
                ex.printStackTrace();
            }
    }

}
