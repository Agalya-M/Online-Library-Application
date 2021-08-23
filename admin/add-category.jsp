
<%@page import = "java.sql.*" %> 
<%
String categoryname = request.getParameter("category");



try{
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","" );
    PreparedStatement ps = conn.prepareStatement("insert into category(categoryname) values(?);");

    ps.setString(1,categoryname);
   
   
    ps.executeUpdate();
     
    response.sendRedirect("./add-category.html");

}
catch(Exception e){
    out.println(e);
}

%>