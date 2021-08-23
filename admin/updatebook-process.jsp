<%@ page import = "java.sql.*" %> 
<%

Connection conn=null;
PreparedStatement ps=null;  

String option = request.getParameter("option");
%>
<%
try{
    String id =request.getParameter("id");
    String bookname = request.getParameter("bookname");
    String category = request.getParameter("category");
    String author = request.getParameter("author");
    String isbn = request.getParameter("isbn");
    Class.forName("com.mysql.cj.jdbc.Driver");  
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
    if(option.equals("1")){
        ps=conn.prepareStatement("update manage_book set bookname='"+bookname+"', category='"+category+"', author='"+author+"',isbn='"+isbn+"' where sno='"+id+"' ");

    
        ps.executeUpdate();}
    else{

         ps=conn.prepareStatement("delete from manage_book where sno='"+id+"' ");
          PreparedStatement ps1 = conn.prepareStatement("update author set noofbooks=noofbooks-1 where author=?");
          PreparedStatement ps2 = conn.prepareStatement("update category set noofbooks=noofbooks-1 where categoryname=?");
         ps2.setString(1,category);
         ps1.setString(1,author);
         ps.executeUpdate();
        ps1.executeUpdate();
        ps2.executeUpdate();
    }    
    response.sendRedirect("manage-books.jsp");
   
}
catch(Exception e){
    out.println(e);
}
%>