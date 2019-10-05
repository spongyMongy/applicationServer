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


public class BuyAll extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement stmt = null;
    Statement stmtBuy = null;
	   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	Dbclass dbase= new Dbclass();
     	dbase.getConnection();	
        String BuyAll = request.getParameter("BuyAll");
        int BuyAll_int = Integer.parseInt(BuyAll);
        
		try {
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        		 } catch(Exception e) {
        		 }
        		 
        	 
                      String sql = "Select * from basket where user_id=?"; 
                      PreparedStatement psm = dbase.getConnection().prepareStatement(sql);
                      psm.setInt(1, BuyAll_int);                         
                      ResultSet rs = psm.executeQuery();
                      
                      // emptying the basket of the user
                        while(rs.next()){
                            String bookNameBasket=rs.getString("book_id");
                            stmtBuy = dbase.getConnection().createStatement();        	      
                            stmtBuy.executeUpdate("delete from basket where user_id="+BuyAll_int+";");

                             
                        }
                        response.sendRedirect("thankyou.html");
                        
	     }catch( Exception ex){
             ex.printStackTrace();
      }
    }

}
