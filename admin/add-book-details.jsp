<%@page import = "java.sql.*" %> 

<%
String bookname = request.getParameter("bookname");
String category = request.getParameter("category");
String author = request.getParameter("author");
String isbn = request.getParameter("isbn");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","" );
    PreparedStatement ps = conn.prepareStatement("insert into manage_book(bookname,category,author,isbn) values(?,?,?,?);");
    PreparedStatement ps1 = conn.prepareStatement("update author set noofbooks=noofbooks+1 where author=?");
    PreparedStatement ps2 = conn.prepareStatement("update category set noofbooks=noofbooks+1 where categoryname=?");
    ps2.setString(1,category);
    ps1.setString(1,author);
    ps.setString(1,bookname);
    ps.setString(2,category);
    ps.setString(3,author);
    ps.setString(4,isbn);

    ps.executeUpdate();
    ps1.executeUpdate();
    ps2.executeUpdate();

    response.sendRedirect("upload-book.jsp");
    
}
catch(Exception e){
    out.println(e);

}

%>