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


public class AddBook extends HttpServlet {
    
	private static final long serialVersionUID = 1L;  
	Statement stmt = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	 Dbclass dbase= new Dbclass();
     	 dbase.getConnection();
    	
     	
     	 //getting parameters from adminpage.jsp
        String book_name=request.getParameter("bookName");
        String book_author=request.getParameter("bookAuthor");       
        String book_price=request.getParameter("bookPrice");
        int price_int = Integer.parseInt(book_price);
        
        try {       		
        		
        		 try{
        			 Class.forName("com.mysql.jdbc.Driver");
        		 } catch(Exception e) {
        		 }
        	    stmt = dbase.getConnection().createStatement();   
        	    stmt.executeUpdate("insert into book(book_name,author,price) values('"+book_name+"','"+book_author+"',"+price_int+");");  
        	    dbase.getConnection().close();
        	    response.sendRedirect("adminPage.jsp");
        	}
        catch(Exception ex){
            ex.printStackTrace();
     }
       
        
                	
    }

}
