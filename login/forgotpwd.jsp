<%@page import = "java.sql.*" %> 
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>LOGIN / Sign Up Form</title>
    <link rel="shortcut icon" href="/assets/favicon.ico">
    <link rel="stylesheet" href="./src/main.css">
</head>
<body background="lib3 image.jpg">
    <div class="container">
    <form class="form form--hidden" action="./forgotPassword.jsp" id="Forgotpassword" method="POST" >
    
        <% 
            try{              
                Connection con= null; 
                PreparedStatement ps = null;
                ResultSet rs = null; 
                String email = request.getParameter("emailinp");
                Class.forName("com.mysql.cj.jdbc.Driver");  
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
                String sql = "select * from student_login where email=?";
                ps = con.prepareStatement(sql);
                ps.setString(1,email);
                rs = ps.executeQuery();
                while(rs.next()){
        %>

        
                <h1 class="form__title">Forgot Password?</h1>
                <div class="form__message form__message--error"></div>
                <div class="form__input-group">
                    <p><%=rs.getString("securityQuestion")%></p>
                    <input type="text" name="answer" placeholder="Enter Answer" required>
                    <input type="hidden" name="emailinp" value="<%=rs.getString("email")%>" required>
                </div>
                <div class="form__input-group">
                    <input type="password" name="old_pwd" id="pass1" class="form__input" autofocus placeholder="New Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
                    <div class="form__input-error-message"></div>
                </div>
                <div class="form__input-group">
                    <input type="password" id="pass2" class="form__input" name="new_pwd" autofocus placeholder="Confirm password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
                    <div class="form__input-error-message"></div>
                </div>
                <button class="form__button" type="submit">Reset Password</button>
              
        </form>
        <%}}
                catch(Exception e){ 
                        System.out.println(e.getMessage()); 
                    } %>
    </div>