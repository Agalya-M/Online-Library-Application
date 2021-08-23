 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>LOGIN / Sign Up Form</title>
    <link rel="shortcut icon" href="/assets/favicon.ico">
    <link rel="stylesheet" href="./src/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <script type="text/javascript" >
        function demo(){
if(document.f.role.value=="0"){
    alert("Please select the Role");
   
return false;

        }
        }
        function myFunction() {
  var x = document.getElementById("id_password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
    </script>
</head>
<body background="lib3 image.jpg">
    <div class="container">
        <form method="POST" name="f" class="form"   id="login" onsubmit="return demo();">
            <h1 class="form__title">LOGIN</h1>
            <div class="form__message form__message--error"></div>
            <div class="bldl">
                <p onclick="Checkrole" style="color: white; padding-right: -90px; margin-left: 38px;">Role:</p>
                <select name="role"  style="position: relative; bottom: 25px; left: 9px; padding: 2.5px 7px;" required>
                <option value="0">Select the role</option>
                <option value="1">Librarian</option>
                <option value="2">Student</option>    
                </select>
            </div>
            <div class="form__input-group">
                <input type="text" class="form__input" name="username" value="" autofocus placeholder="Username or email" required>
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
               
               <input type="password" class="form__input" name="password" value="" autofocus placeholder="Password" id="id_password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
               ><input type="checkbox" style="margin-top:20px;" onclick="myFunction()">Show Password
              
            </div>
            <button class="form__button" type="submit">Sign in</button>
            <p class="form__text">
                <a href="./email.html" class="form__link" id="linkForgotpassword">Forgot your password?</a>
            </p>
            <p class="form__text">
                <a class="form__link" href="./createuser.html" id="linkCreateAccount">Don't have an account? Create account</a>
            </p>
        </form>
    
    </div>


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
                %>
              
             <script type="text/javascript">
            
alert("Invaild Username or Password.");
            
</script> <%

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
                
                %>
             <script language="javascript">
             

             
alert("Invaild Username or Password");
          
</script> <%
                rs.close(); 
                ps.close(); 
            }
        }
    }
    
}
catch(Exception e){
 
}

 
  
%>


    <!-- <script src="./src/main.js"></script> -->
</body>
</html>