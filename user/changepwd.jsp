<%@page import = "java.sql.*" %> 

<%
    Connection conn= null; 
    PreparedStatement p1 = null; 
PreparedStatement p2 = null; 
    ResultSet rs = null;
    ResultSet rs1 = null;
    String real_pwd = null;
    String old_pwd = request.getParameter("password");
    String new_pwd = request.getParameter("newpassword");
    String cnf_pwd = request.getParameter("confirmpassword");
    String ses_uname = (String)session.getAttribute("username");
    
 
        Class.forName("com.mysql.cj.jdbc.Driver");  
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
        
            p1 = conn.prepareStatement("select * from student_login where username=?");
            p1.setString(1, ses_uname);
            rs = p1.executeQuery();
     
       
        
        if(rs.next()){
            real_pwd = rs.getString("password");
            if(old_pwd.equals(real_pwd)){
                    
                    p2 = conn.prepareStatement("update student_login set password=? where username=?");
                    p2.setString(1, new_pwd);
                    p2.setString(2, ses_uname);
                    p2.executeUpdate();
                   
                response.sendRedirect("change-password.html");
            }
            else{
    
                response.sendRedirect("change-password.html");
            }
        }

    
 
%>