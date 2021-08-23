<%@ page import = "java.sql.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    
    <title>Online Library Management System | Manage Authors</title>
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
                            <li><a href='dashboard.' >DASHBOARD</a></li>
                           
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"> Categories <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="add-category.html">Add Category</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="manage-categories.jsp">Manage Categories</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"class="menu-top-active"> Authors <i class="fa fa-angle-down"></i></a>
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
    <div class="content-wra">
        <div class="content-wrapper">
             <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Update Book Information</h4>
                    
                                </div>
    
    </div>
   
    <div class="row">
    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
    <div class="panel panel-info">
    <div class="panel-heading">
   Book Information
    </div>
    
    <div class="panel-body">
     
                   <% 
               
                        
                        Connection conn=null;
                        Statement stat=null;
                        ResultSet res=null;
                        PreparedStatement ps=null;  
                        Class.forName("com.mysql.cj.jdbc.Driver");  
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                    %>
                       
                   
        <form  method="post" action="updatebook-process.jsp">
            <%
            try{
            stat=conn.createStatement();
            String u=request.getParameter("u");
            int num=Integer.parseInt(u);
            String data="select * from manage_book where sno='"+num+"'";
            res=stat.executeQuery(data);
            while(res.next()){
                %>
            
            <input type="hidden" name="id" value="<%=res.getString("sno") %>"/>

          
            <label>Book Name</label>
            <input class="form-control" type="text" name="bookname" value="<%=res.getString("bookname")%>" autocomplete="off" required />
            </div>
            
            <div class="form-group">
                <label> Category</label>
                <% 
                
                                                        try{ 
                                                            Class.forName("com.mysql.cj.jdbc.Driver");  
                                                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                                                            Statement st=conn.createStatement();
                                                          
                                                         
                                                            ResultSet rs = st.executeQuery("select * from category");
                                                    
                                                           
                                                         %>
                <select class="form-control" name="category"  autocomplete="off" required>
                <option value="<%=res.getString("category")%>" ><%=res.getString("category")%> </option>
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
                                                           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root",""); 
                                                            Statement st=conn.createStatement();
                                                          
                                                         
                                                            ResultSet rs = st.executeQuery("select * from author");
                                                    
                                                           
                                                         %>
                <select class="form-control" name="author"   autocomplete="off" required>
                <option value="<%=res.getString("author")%>"> <%=res.getString("author")%></option>
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
            <input class="form-control" type="text" name="isbn"  value="<%=res.getString("isbn")%>"  required />
            <p class="help-block">An ISBN is an International Standard Book Number.ISBN Must be unique</p>
            </div>
            
                <%
            }}catch(Exception e){ 
                System.out.println(e.getMessage()); 
            } %>
            <select class=" btn-info" name="option">
                <option class=" btn-info" value="1">Update</option>
                <option class=" btn-info" value="0">Delete</option>
            </select>
        <button type="submit" class="btn btn-info">submit </button>
   
                                        </form>
                                       
                                </div>
                            </div>
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
   <!-- DATATABLE SCRIPTS  
   <script src="assets/js/dataTables/jquery.dataTables.js"></script>-->
   <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
     <!-- CUSTOM SCRIPTS  -->
   <script src="assets/js/custom.js"></script>
</body>
</html>