package pack;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement stmt = null;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Dbclass dbase= new Dbclass();
    	dbase.getConnection();
        
        
        //for login 
    	String userName1=request.getParameter("userName1");
        String password1=request.getParameter("password1");
        
        
        //for register
        String userName2=request.getParameter("userName2");
        String password2=request.getParameter("password2");
        
        String submitType=request.getParameter("submit");      
        
        String dbName=null;
        String dbPassword=null;
        
        if(submitType.equals("register")) {
        	try {
        
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        			
        		 } catch(Exception e) {
        			
        		 }
        	 
        	     
        	      stmt = dbase.getConnection().createStatement(); 
        	      
        	      
        	      stmt.executeUpdate("insert into customer(name,password) values('"+userName2+"','"+password2+"');");
        		
        	      dbase.getConnection().close();
        	      response.sendRedirect("userPage.jsp");
        	}
        	catch(Exception ex){
                ex.printStackTrace();
         }
	}if(submitType.equals("login")) {
         
            try {
        		
        		
        		 try{
        			 Class.forName("com.mysql.cj.jdbc.Driver");
        	
        		 } catch(Exception e) {
        		
        		 }
        		 
        	    
        	 
                      String sql = "Select * from customer where name=? and password=?"; 
                      PreparedStatement psm = dbase.getConnection().prepareStatement(sql);
                      psm.setString(1, userName1);
                      psm.setString(2, password1);
            
                      ResultSet rs = psm.executeQuery();
                      //checking for admin 
                        if(password1.equals("tomcat") && userName1.equals("tomcat")){
                                response.sendRedirect("adminPage.jsp");

                            }
                        
                        //checking for available users if exist
                        else if(rs.next()){
                                HttpSession recordUserData = request.getSession(true);
                                recordUserData.setAttribute("user_name", userName1);
                                recordUserData.setAttribute("user_id", rs.getString("userid"));
                                
                              response.sendRedirect("userPage.jsp");
                               
                        }
                        else {
                        	
                        	 
                       response.sendRedirect("index.html");
                        	
                
                    
                        } 

        	}
            catch(Exception ex){
                ex.printStackTrace();
         }
        
        }
        else{
    
    
        }

 }  

}
