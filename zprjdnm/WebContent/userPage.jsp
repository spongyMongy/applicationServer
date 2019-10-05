<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user_name")==null){
        response.sendRedirect("index.html");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 50;
                font-family: Calibri, Helvetica, sans-serif;
            }

            /* Style the side navigation */
            .sidenav {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                right: 0;
                background-color: #FFC0CB;
                overflow-x: hidden;
                color:white;
            }


            /* Side navigation links */
            .sidenav a {
               color: white;
               padding: 25px;
               text-decoration: none;
               display: block;
            }

            /* Change color on hover */
            .sidenav a:hover {
                background-color: #eee;
                color: black;
            }

            /* Style the content */
            .content {
                margin-left: 50px;
                padding-left: 20px;
                margin-right: 400px;
                padding-right: 400px;
                
            }
            .hizala{
                text-align: right;
                margin-right: 180px;
                margin-bottom: 80px;
            }
            .sagaHizala{
                text-align: right;
                margin-top: -19px;
                margin-right: 150px;
          
        </style>
    <title>JSP Page</title>
</head>
<body >

 <img src='img/logo1.jpg' style='width:10%;height:10%' alt='[]' />
    
    <div class="sidenav">
        <h3>Your Basket</h3></br></br></br>
        <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; 
        String user="root";
        String password="12qwaszx";
        Connection conn = null; 
        
        
        conn=DriverManager.getConnection(url, user, password);
        String user_id=(String)session.getAttribute("user_id");
        Integer userIdInt=Integer.parseInt(user_id);
        String sql2 = "Select * from basket where user_id=?"; 
                  PreparedStatement psm2 = conn.prepareStatement(sql2);
                  psm2.setInt(1, userIdInt);
        ResultSet rs2=null;
        rs2=psm2.executeQuery();
            
        %>
        <table class="table table-hover">
              <thead>
                <tr>
                  <th>Book</th>
                  <th>Price</th>
                  <%
                    while(rs2.next()){
                    %>
                </tr>
              </thead>
              <tbody>
                <tr>
                   <td><%   
                      Integer bookIdBasket=rs2.getInt("book_id");
                      String sql3 = "Select * from book where book_id=?"; 
                      
                      PreparedStatement psm3= conn.prepareStatement(sql3);
                      psm3.setInt(1, bookIdBasket);
                      
                      ResultSet rs3=null;
                      rs3=psm3.executeQuery();
                      if(rs3.next()){
                        String bookNameBasket=rs3.getString("book_name");
                        out.print(bookNameBasket);
                      
                      %></td> 
                      <td><%   
                        Integer bookPriceBasket=rs3.getInt("price");
                        out.print(bookPriceBasket);  
                      }
                      %></td>  
                </tr>
                <%
                    }
                %>
                
              </tbody>
            </table>
            
        
                                        
                                        </br> </br> </br>
	   		<form action="ClearCart" method="post" class="btn-centres">
                            <input type="hidden" name="ClearAll" value="<%
                                out.print(user_id);%>">
                            <input type="submit" value="Clear Basket" class="btn btn-primary black-background white"/>
                        </form></br>
                        <form action="BuyAll" method="post" class="btn-centres">
                            <input type="hidden" name="BuyAll" value="<%
                                out.print(user_id);%>">
                            <input type="submit" value="BUY" class="btn btn-primary black-background white"/>
	   		</form>
    </div>

    <div class="content">
        <div class="container">
            <h2>BOOK SHOP</h2></br></br></br></br></br></br></br>
            <% 
            
            String sql="select * from book";
            
            PreparedStatement statement=conn.prepareStatement(sql);
            ResultSet rs=null;
            rs=statement.executeQuery();
            %>
                
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>Book</th>
                  <th>Author</th>
                  <th>Price</th>

                  <%
                    while(rs.next()){
                    %>
                </tr>
              </thead>
              <tbody>
                <tr>
                   <td><%   
                      Integer bookId=rs.getInt("book_id");
                      String bookIdString = Integer.toString(bookId);
                      
                      String bookName=rs.getString("book_name");
                      out.print(bookName);                     
                      %></td>                    
                  <td><%
                      String booksAuthor=rs.getString("author");
                      out.print(booksAuthor);                      
                      %>
                  </td>
                  <td>
                      <%
                      Integer booksPrice=rs.getInt("price");
                      out.print(booksPrice);
                      
                      %>
                  </td>
                  <td>
                        <form action="AddtoBasket" method="post" >
                            <input type="hidden" name="book_id" value="<%
                                out.print(bookIdString);%>">
                             <input type="hidden" name="user_id" value="<%
                                out.print(user_id);%>">
                            <button type="submit" class="btn btn-primary black-background white" >Add to Basket</button>
                        </form>
                  </td>
                </tr>
                <%
                    }
                %>
                
              </tbody>
            </table>
        </div></br></br></br></br></br>
        <div class="hizala"><h2><a href="Logout">Log Out</a></h2></div>

    </div>

    
</body>
</html>
