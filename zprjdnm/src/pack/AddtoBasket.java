package pack;

import java.io.IOException;
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

public class AddtoBasket extends HttpServlet {
    
	
	private static final long serialVersionUID = 1L;
    Statement stmt = null;
    PreparedStatement ps = null;
	ResultSet rs = null;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	 Dbclass dbase= new Dbclass();
     	 dbase.getConnection();
     	 // getting parameters from userPage.jsp
		 String book_id = request.getParameter("book_id");
         Integer book_id_int=Integer.parseInt(book_id);             
         String user_id = request.getParameter("user_id");
         Integer user_id_int=Integer.parseInt(user_id);
                
         try {       		
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        		 } catch(ClassNotFoundException e) {
        		 }
        		 
        	
        	      stmt = dbase.getConnection().createStatement(); 
        	      stmt.executeUpdate("insert into basket(user_id,book_id) values("+user_id_int+","+book_id_int+");");	
        	      dbase.getConnection().close();
        	      response.sendRedirect("userPage.jsp");
        }
      catch(Exception ex){
        ex.printStackTrace();
 }
                
                
			
	}


}
