<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*"%>
<%@ page import = "java.sql.*" %> 
<html>
<body>
    <% 
  

     
    Connection conn=null;
    Statement stat=null;
    ResultSet res=null;
    PreparedStatement ps=null;  
    Class.forName("com.mysql.cj.jdbc.Driver");  
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
    %>
    <%
            try{
            stat=conn.createStatement();
            String u=request.getParameter("u");
            int num=Integer.parseInt(u);
            String data="select * from manage_book where sno='"+num+"'";
            res=stat.executeQuery(data);
            while(res.next()){
                %>
  
                        <iframe id="fred" style="border:1px solid #666CCC" title="PDF in an i-Frame" src="../book_pdf/<%=res.getString("path")%>"  frameborder="1" scrolling="auto" height="1100" width="100%" ></iframe>
    
        <%
    }}catch(Exception e){ 
        System.out.println(e.getMessage()); 
    } %>

    </body>
</html>