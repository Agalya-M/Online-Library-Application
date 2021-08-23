<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*" %>  

<%! String userdbName; 
String userdbPsw;
String sql;
%> 
<% 
Connection con= null; 
PreparedStatement ps = null; 
ResultSet rs = null; 
 
String lib_uname = "librarian";
String lib_pwd = "Librarian@123";

String driverName = "com.mysql.cj.jdbc.Driver"; 
String url = "jdbc:mysql://localhost:3306/library"; 
String user = "root"; 
String dbpsw = ""; 

String username = request.getParameter("username"); 
String password = request.getParameter("password"); 
String role = request.getParameter("role"); 

 


try{
    if (!(role.equals("0"))){
        if (role.equals("1")){
            if(username.equals(lib_uname) && password.equals(lib_pwd)){
                response.sendRedirect("../library/admin/dashboard.jsp");
            }
            else{
                response.sendRedirect("indexFail.html");
            }
        }
        else{

            sql = "select * from student_login where username=? and password=? ";
            
            Class.forName(driverName); 
            con = DriverManager.getConnection(url, user, dbpsw); 
            ps = con.prepareStatement(sql);
            ps.setString(1, username); 
            ps.setString(2, password); 
            
            rs = ps.executeQuery(); 
            if(rs.next()) 
            {  
                userdbName = rs.getString("username"); 
                userdbPsw = rs.getString("password"); 
            
                if(username.equals(userdbName) && password.equals(userdbPsw)) 
                { 
                session.setAttribute("username",userdbName); 
                session.setAttribute("password", password);  
                response.sendRedirect("../library/home.html");
                }  
            } 
            else {
                
                response.sendRedirect("indexFail.html"); 
                rs.close(); 
                ps.close(); 
            }
        }
    }
    else{
        response.sendRedirect("indexFail2.html"); 
    }
}
catch(Exception e){
    out.println(e);
}

 
  
%>
