<%@ page import = "java.sql.*" %> 
<%

Connection conn=null;
PreparedStatement ps=null;  

String option = request.getParameter("option");
%>
<%
try{
    String id1 =request.getParameter("id");
    String category1=request.getParameter("category1");
    Class.forName("com.mysql.cj.jdbc.Driver");  
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
    if(option.equals("1")){
        ps=conn.prepareStatement("update category set categoryname='"+category1+"' where id='"+id1+"' ");

    
        ps.executeUpdate();}
    else{
         ps=conn.prepareStatement("delete from category where id='"+id1+"' ");
         
         ps.executeUpdate();
    }    
    response.sendRedirect("manage-categories.jsp");
   
}
catch(Exception e){
    out.println(e);
}
%>