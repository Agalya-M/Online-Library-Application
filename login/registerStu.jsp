<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %> 
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer= request.getParameter("answer");
String password = request.getParameter("password");
String driverName = "com.mysql.jdbc.Driver"; 
String url = "jdbc:mysql://localhost:3306/library"; 
String user = "root"; 
String dbpsw = "";
Connection con= null; 
PreparedStatement ps = null; 
ResultSet rs = null;
try{
    
    Class.forName(driverName); 
    con = DriverManager.getConnection(url,user,dbpsw); 
    ps = con.prepareStatement("insert into student_login(username, email, mobilenumber, securityQuestion, answer, password) values(?,?,?,?,?,?);");

    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,mobilenumber);
    ps.setString(4,securityQuestion);
    ps.setString(5,answer);
    ps.setString(6,password);
   
    ps.executeUpdate();

    response.sendRedirect("./index.html");

}
catch(Exception e){
    out.println(e);
}

%>