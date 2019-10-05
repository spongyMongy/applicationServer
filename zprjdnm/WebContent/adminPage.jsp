

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
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
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Style the side navigation */
            .sidenav {
                height: 100%;
                width: 200px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #FFC0CB;
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
    <title>JSP Page</title>
</head>
<body>
    
    <div class="sidenav">
        <h3>INSERTING</h3></br></br></br>
                                      
	   		<form action="AddBook" method="post" class="btn-centres">
                                <input type="text" name="bookName" class="form-control" placeholder="Enter Book's Name"></br>
                                <input type="text" name="bookAuthor" class="form-control" placeholder="Enter Book's Author"></br>
                                <input type="text" name="bookPrice" class="form-control" placeholder="Enter Book's Price"></br>
	   			<input type="submit" value="Add Book" class="btn btn-primary black-background white"/>
                        </form></br>
                        
    </div>

    <div class="content">
        <div class="container">
            <h2>Book Shop - Admin</h2></br></br></br></br></br></br></br>
            <% 
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; 
            String user="root";
            String password="12qwaszx";
            Connection conn = null; 
            
            
            conn=DriverManager.getConnection(url, user, password);
            String sql="select * from book";
            
            PreparedStatement statement=conn.prepareStatement(sql);
            ResultSet rs=null;
            rs=statement.executeQuery();
            %>
                     
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Author</th>
                  <th>Price</th>
                                    <th>delete</th>
                  
                  <%
                    while(rs.next()){
                    %>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><%   
                      Integer bookId=rs.getInt("book_id");
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
                        <form action="DeleteBook" method="post" >
                            <input type="hidden" name="id" value="<%
                                out.print(bookId);%>">
                            <button type="submit" class="btn btn-primary black-background white" >Delete</button>
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



