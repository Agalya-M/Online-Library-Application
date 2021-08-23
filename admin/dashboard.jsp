<%@ page import = "java.sql.*" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Online Library Management System | Admin Dash Board</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------MENU SECTION START-->

      <div class="img1">
        <div class="site-logo">
            <img src="assets\css\circle-cropped.png" alt="logo" width="100px" height="100px" >
          </div>
        <p class="appname">Online <i class="lib"> Library </i></p>
        <div class="right-div">
            <a href="../../login/index.html" class="btn btn-danger pull-right">LOG ME OUT</a>
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
                            <li><a href='dashboard.jsp'  class="menu-top-active" >DASHBOARD</a></li>
                           
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"> Categories <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="add-category.html">Add Category</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="manage-categories.jsp">Manage Categories</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"> Authors <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="add-author.html">Add Author</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="manage-authors.jsp">Manage Authors</a></li>
                                </ul>
                            </li>
 <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"> Books <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="add-book.jsp">Add Book</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="manage-books.jsp">Manage Books</a></li>
                                </ul>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
<!-- MENU SECTION END-->
 <% 
try{ 
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 

    String author =request.getParameter("author"); 
    PreparedStatement ps1 = conn.prepareStatement("select count(*) as Bcnt from manage_book");
    PreparedStatement ps2 = conn.prepareStatement("select count(*) as Scnt from student_login");
    PreparedStatement ps3 = conn.prepareStatement("select count(*) as Ccnt from category");
    
    ResultSet rs1 = ps1.executeQuery();
    ResultSet rs2 = ps2.executeQuery();
    ResultSet rs3 = ps3.executeQuery();
    rs1.next();
    rs2.next();
    rs3.next();
     
        %>
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">ADMIN DASHBOARD</h4>
                
             </div>

        </div>
             
             <div class="row">

        <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-book fa-5x"></i>


                      <h3><%=rs1.getString("Bcnt")%></h3>
                      Books Listed
                        </div>
                    </div>

            
               <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-danger back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                           
                           <h3><%=rs2.getString("Scnt")%></h3>
                           Registered Users
                        </div>
                    </div>
                    
                 <div class="col-md-3 col-sm-3 rscol-xs-6">
                    <div class="alert alert-info back-widget-set text-center">
                          <i class="fa fa-file-archive-o fa-5x"></i>
                         <h3><%=rs3.getString("Ccnt")%></h3>
                         Listed Categories
                      </div>
                  </div>
           

        </div>
        <% 
                    }catch(Exception e){ 
                        System.out.println(e.getMessage()); 
                    } 
                
            %>



    
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->

      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>