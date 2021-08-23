
<%@page import = "java.sql.*" %> 
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/library";

String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Manage Categories</title>
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
                            <li><a href='dashboard.jsp'  >DASHBOARD</a></li>
                           
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"class="menu-top-active" > Categories <i class="fa fa-angle-down"></i></a>
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
                            </li>

                    

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
                <h4 class="header-line">Manage Categories</h4>
    </div>
   
    <form >
        <label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="category" required></label>
           
            <div>
                  
                <button type="submit" class="btn">Search</button> 
            </div>
            <br>  
        </form>
</div>


        </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Categories Listing
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form action="updatecategory.jsp" method="POST">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Category</th>
                                            <th>Number of Books</th>
                                            
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                        try{ 
                                            Class.forName("com.mysql.cj.jdbc.Driver");  
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                            
                                            String category =request.getParameter("category"); 
                                            PreparedStatement ps = conn.prepareStatement("select * from category where categoryname=?");
                                            ps.setString(1,category);
                                            ResultSet rs = ps.executeQuery();
                                    
                                            while(rs.next()){ 
                                                %>
                                
                                
                                        <tr class="odd gradeX">
                                            <td class="center"><%=rs.getString("id") %></td>
                                           
                                            <td class="center"><%=rs.getString("categoryname") %></td>
                                            
                                            <td class="center"><%=rs.getString("noofbooks") %></td>
                                           
                                            <td class="center"><button class="btn btn-primary" value="<%=rs.getString("id")%>" name="u" type="submit">Edit</button>
                                    
                                            </td>
                                        </tr>
                                    
                                    </tbody>
                                  
                                    <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                                </table>
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
