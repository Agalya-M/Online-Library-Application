<%@ page import = "java.sql.*" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Add Book</title>
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
                            <li><a href='dashboard.jsp'   >DASHBOARD</a></li>
                           
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
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown" class="menu-top-active"> Books <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="add-book.jsp">Add Book</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="manage-books.jsp">Manage Books</a></li>
                                </ul>
                            </li>

                    

                        </ul>
                    </div>
                </div>
 </div>
        </div>
    </section>
    </div>
<!-- MENU SECTION END-->
    <div class="content-wra">
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Book</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<div class="panel panel-info">
<div class="panel-heading">
Book Info
</div>
<div class="panel-body">
<form role="form" action="./add-book-details.jsp" method="post">
<div class="form-group">
<label>Book Name</label>
<input class="form-control" type="text" name="bookname" autocomplete="off" required />
</div>

<div class="form-group">
    <label> Category</label>
    <% 
    
                                            try{ 
                                                Class.forName("com.mysql.cj.jdbc.Driver");  
                                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                                                Statement st=conn.createStatement();
                                              
                                             
                                                ResultSet rs = st.executeQuery("select * from category");
                                        
                                               
                                             %>
    <select class="form-control" name="category" autocomplete="off" required>
    <option value="0"> Select Category</option>
    <% 
    
                                                while(rs.next()){ 
                                             %>
    <option value="<%=rs.getString("categoryname")%>"><%=rs.getString("categoryname")%></option>
    <%
    }}catch(Exception e){
        
    } %>
    
    </select>
    </div>
    
    
    
    
    <div class="form-group">
    
    <label> Author</label>
    <% 
    
                                            try{ 
                                                Class.forName("com.mysql.cj.jdbc.Driver");  
                                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                                                Statement st=conn.createStatement();
                                              
                                             
                                                ResultSet rs = st.executeQuery("select * from author");
                                        
                                               
                                             %>
    <select class="form-control" name="author" autocomplete="off" required>
    <option value="0"> Select Author</option>
    <% 
    
    while(rs.next()){ 
    %>
    <option value="<%=rs.getString("author")%>"><%=rs.getString("author")%></option>
    <%
    }}catch(Exception e){
        
    } %>
    
    
    </select>
    </div>

<div class="form-group">
<label>ISBN Number</label>
<input class="form-control" type="text" name="isbn"    required />
<p class="help-block">An ISBN is an International Standard Book Number.ISBN Must be unique</p>
</div>
<button type="submit" name="add" class="btn btn-info">Add</button>


                                    </form>
                            </div>
                        </div>
                            </div>

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
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>