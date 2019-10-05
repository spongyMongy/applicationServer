package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Dbclass {

	
	//main Db class to be used in other classes
		public Connection getConnection() {
			
			 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
		     final String DB_URL = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; 
			 
			   //  Database credentials 
		      final String USER = "root"; 
			  final String PASS = "12qwaszx"; 
			  Connection conn =null;
			  

			   PreparedStatement ps = null;
			   ResultSet rs = null;
			   try {	  conn = DriverManager.getConnection(DB_URL,USER,PASS); 
		         }
			   catch(Exception ex){}
			   
			 return conn;

		}
		
	
			
			

	
}
