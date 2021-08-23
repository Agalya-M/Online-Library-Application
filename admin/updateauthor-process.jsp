<%@ page import = "java.sql.*" %> 
<%

Connection conn=null;
PreparedStatement ps=null;  

String option = request.getParameter("option");
%>
<%
try{
    String id1 =request.getParameter("id");
    String author1=request.getParameter("author1");
    Class.forName("com.mysql.cj.jdbc.Driver");  
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
    if(option.equals("1")){
        ps=conn.prepareStatement("update author set author='"+author1+"' where id='"+id1+"' ");

    
        ps.executeUpdate();}
    else{
         ps=conn.prepareStatement("delete from author where id='"+id1+"' ");
         
         ps.executeUpdate();
    }    
    response.sendRedirect("manage-authors.jsp");
   
}
catch(Exception e){
    out.println(e);
}
%>