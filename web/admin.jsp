<%@page import="com.myshop.connection.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("alert_message", "You are not Logged In!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("normal")) {
            session.setAttribute("alert_message", "You are not admin!!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/card.css">
        <link rel="stylesheet" href="css/samplecss.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="components/new_navbar.jsp" %>
        <div class="wrapper">
            <div class="main_content">
                <%@include  file="components/success.jsp" %>
                <div class="info">
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Users</b></h4>
                                    <a href="students.jsp">Click to see Last User</a> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Categories</b></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Products</b></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Orders</b></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                    </div>
<!-- ************************************************************************************* -->

                    <div class="row">
                        <div class="column">
                            <div class="card" data-toggle="modal" data-target="#category-modal">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><span onclick="document.getElementById('category-modal').style.display='block'" style="width:auto;">Click to
                                            Add Category</span></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Delete Category</b></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Add Product</b></h4> 
                                    <a href="products.jsp">Click to see Add Products</a> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Delete Product</b></h4> 
                                    <p>Architect & Engineer</p> 
                                </div>
                            </div>
                        </div>
                    </div>
<!-- **************************************************************************************************** -->
                    

                    <!--Add Category Modal 
                    <button onclick="document.getElementById('category-modal').style.display='block'" style="width:auto;">Login</button>

                    -->
                    <div id="category-form">
                      <div id="category-modal" class="modal">
                            
                        <form class="modal-content animate" action="CategoryServlet" method="post">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('category-modal').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                <h2> Add Category</h2>
                            </div>

                            <div class="container">
                                <label for="category_name"><b>Category Name</b></label>
                                <input type="text" placeholder="Enter CAtegory Name" name="cat_name" required>

                                <label for="category_desp"><b>Description</b></label>
                                <input type="text" placeholder="Enter Description" name="cat_desp" required>

                                <button type="submit">Save</button>
                            </div>
                        </form>
                    </div>
                        </div>
                    <!-- End Category Modal -->  
                       
                    



                </div>
            </div>
        </div>




    </body>
</html>