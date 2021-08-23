<%@page import = "java.sql.*" %> 
<%
String author = request.getParameter("author");



try{
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","" );
    PreparedStatement ps = conn.prepareStatement("insert into author(author) values(?);");

    ps.setString(1,author);
   
   
    ps.executeUpdate();
     
    response.sendRedirect("./add-author.html");
   
}
catch(Exception e){
    out.println(e);
}

%>