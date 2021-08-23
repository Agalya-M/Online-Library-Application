<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String answer = request.getParameter("answer");
String old_pwd = request.getParameter("old_pwd");
String new_pwd = request.getParameter("new_pwd");
String email = request.getParameter("emailinp");

Connection con= null; 
PreparedStatement ps = null; 
PreparedStatement ps1 = null; 
ResultSet rs = null;
try{
    Class.forName("com.mysql.cj.jdbc.Driver");  
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
    String sql = "select * from student_login where email=?";
    ps = con.prepareStatement(sql);
     out.println(email);
    ps.setString(1,email);
    rs = ps.executeQuery();
    rs.next();
    String org_ans = rs.getString("answer");
    out.println(org_ans);
    out.println(answer);

    

    if(answer.equals(org_ans)){
        ps1 = con.prepareStatement("update student_login set password='"+new_pwd+"' where email='"+email+"' ");
        ps1.executeUpdate();
        response.sendRedirect("./index.html");
        
        
    }
    else{
         response.sendRedirect("./email.html");
       

       
    }
   
    
}
catch(Exception e)
{
    System.out.println(e);
}
%>