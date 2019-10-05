

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user_name")==null){
        response.sendRedirect("/BookApplicationFinal/");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
             body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Style the side navigation */
            .sidenav {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                color:white;
            }


            /* Side navigation links */
            .sidenav a {
               color: white;
               padding: 16px;
               text-decoration: none;
               display: block;
            }

            /* Change color on hover */
            .sidenav a:hover {
                background-color: #ddd;
                color: black;
            }

            /* Style the content */
            .content {
                margin-left: 200px;
                padding-left: 20px;
            }
            .hizala{
                text-align: right;
                margin-right: 50px;
                margin-bottom: 50px;
            }
            .sagaHizala{
                text-align: right;
                margin-top: -19px;
                margin-right: 15px;
            }
          
        </style>
</head>
<body>
    

        <div class="container">
        <h1>Books You Bought</h1></br></br></br>
        <%
        Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; 
            String user="root";
            String password="12qwaszx";
            Connection conn = null; 
            
            
            conn=DriverManager.getConnection(url, user, password);
            String user_id=(String)session.getAttribute("user_id");
            Integer userIdInt=Integer.parseInt(user_id);
            String sql2 = "Select * from purchased where user_id=?"; 
                      PreparedStatement psm2 = conn.prepareStatement(sql2);
                      psm2.setInt(1, userIdInt);
            ResultSet rs2=null;
            rs2=psm2.executeQuery();
            
        %>
        <table class="table table-hover">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Price</th>
                  <%
                    while(rs2.next()){
                    %>
                </tr>
              </thead>
              <tbody>
                <tr>
                   <td><%   
                      Integer bookIdPurchased=rs2.getInt("book_id");
                      String sql3 = "Select * from book where book_id=?"; 
                      
                      PreparedStatement psm3= conn.prepareStatement(sql3);
                      psm3.setInt(1, bookIdPurchased);
                      
                      ResultSet rs3=null;
                      rs3=psm3.executeQuery();
                      if(rs3.next()){
                        String bookNamePurchased=rs3.getString("book_name");
                        out.print(bookNamePurchased);
                      
                      %></td> 
                      <td><%   
                        Integer bookPricePurchased=rs3.getInt("price");
                        out.print(bookPricePurchased);  
                      }
                      %></td>  
                </tr>
                <%
                    }
                %>
                
              </tbody>
            </table>
            
        
                                        
                                        </br> </br> </br>
                        <form action="userPage.jsp" method="post" class="btn-centres">
                            <input type="submit" value="Go MainPage" class="btn btn-primary black-background white"/>
	   		</form>
                                        
                        <div class="hizala"><h2><a href="Exit">Log Out</a></h2></div>
        </div>
</div
</body>
</html>
