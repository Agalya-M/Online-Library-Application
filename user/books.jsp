<%@ page import = "java.sql.*" %> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Manage Books</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- DATATABLE STYLE  -->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
      <!------MENU SECTION START-->
<%    
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        if(session.getAttribute("username") == null){
            response.sendRedirect("../login/index.html");
        }

    %>
      <div class="img1">
        <div class="site-logo">
            <img src="admin\assets\css\circle-cropped.png" alt="logo" width="100px" height="100px" >
          </div>
        <p class="appname">Online <i class="lib"> Library </i></p>
        <div class="right-div">
            <a href="./logut.jsp" class="btn btn-danger pull-right">LOG ME OUT</a>
        </div>
  </div>
<div class="navbar navbar-inverse set-radius-zero" >
   

    <!-- LOGO HEADER END-->
            
<section class="menu-section">
    <div class="container">
        <div class="row ">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">
                        <li><a href="home.html" >Home</a></li>
                        <li><a href="books.jsp" class="menu-top-active">Books</a></li>
                       
                      
                        <li><a href="change-password.html"  >Change Password</a></li>
          

                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
</div>

<!-- MENU SECTION END-->
<div class="content-wrapper">
    <div class="container">
   <div class="row pad-botm">
       <div class="col-md-12">
           <h4 class="header-line">Books</h4>
</div>
<form >
    <div class="radio-btn">
        <label>Search By: </label>
        <input type="radio" name="option" value="isbn" >
        <label>ISBN</label>
        <input type="radio" name="option" value="author" >
        <label>Author</label>
        <input type="radio" name="option" value="category" >
        <label>Category</label>
        <input type="radio" name="option" value="bookname" >
        <label>Book</label>
      </div>  
   <label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="searchby" required></label>
      
       <div>
              
           <button type="submit" class="btn">Search</button> 
       </div>
       <br>  
   </form>
<div class="row">



   </div>
       <div class="row">
           <div class="col-md-12">
               <!-- Advanced Tables -->
               <div class="panel panel-default">
                   <div class="panel-heading">
                      Books 
                   </div>
                   <div class="panel-body">
                       <div class="table-responsive">
                        <form action="Read-pdf.jsp" method="POST">
                           <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                               <thead>
                                   <tr>
                                       <th>S.NO</th>
                                       <th>Book Name</th>
                                       <th>Category</th>
                                       <th>Author</th>
                                       <th>ISBN</th>
                                    
                                       <th>Action</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <% 
                                   try{ 
                                       Class.forName("com.mysql.cj.jdbc.Driver");  
                                       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                                       PreparedStatement ps1 = null;
                                       String searchby=request.getParameter("searchby"); 
                                      
                                       String option = request.getParameter("option");
                                       if(option.equals("isbn")){
                                        ps1 = con.prepareStatement("select * from manage_book where isbn='"+searchby+"'");
                                       }
                                       else if(option.equals("author")){
                                        ps1 = con.prepareStatement("select * from manage_book where author='"+searchby+"'");
                                       }
                                       else if(option.equals("category")){
                                        ps1 = con.prepareStatement("select * from manage_book where category='"+searchby+"'");
                                       }
                                       else if(option.equals("bookname")) {
                                        ps1 = con.prepareStatement("select * from manage_book where bookname='"+searchby+"'");
                                       }
                                       else{
                                        response.sendRedirect("booksFail1.jsp"); 
                                       }
                                      

                                       ResultSet rs = ps1.executeQuery();
                               
                                       while(rs.next()){ 
                                    %>
                           
                           <tr class="odd gradeX">
                                       <td class="center"><%=rs.getString("sno")%></td>
                                       <td class="center"><%=rs.getString("bookname")%></td>
                                       <td class="center"><%=rs.getString("category")%></td>
                                       <td class="center"><%=rs.getString("author")%></td>
                                       
                                       <td class="center"><%=rs.getString("isbn")%></td>
                                       
                                       <td class="center"><button class="btn btn-primary" value="<%=rs.getString("sno")%>" name="u" type="submit">Read</button>
                               
                                       </td>
                                   </tr>
                                   <% }
                               }catch(Exception e){ 
                                   System.out.println(e.getMessage()); 
                               } %>
                               </tbody>
                                 
   
                           </table>
                       </form>
                       </div>
                       
                   </div>
               </div>
               <!--End Advanced Tables -->
           </div>
       </div>


       
</div>
</div>

     <!-- CONTENT-WRAPPER SECTION END-->
  
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- DATATABLE SCRIPTS  -->
   <!-- <script src="assets/js/dataTables/jquery.dataTables.js"></script>-->
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
