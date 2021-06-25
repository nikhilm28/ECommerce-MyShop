<%@page import="com.myshop.connection.Order"%>
<%@page import="com.myshop.dao.OrderDAO"%>
<%@page import="com.myshop.dao.UserDAO"%>
<%@page import="com.myshop.connection.Product"%>
<%@page import="com.myshop.dao.ProductDAO"%>
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
        
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
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
                    <%  UserDAO udao = new UserDAO(DAOConnection.sqlconnection());
                        List<User> ulist = udao.getAllUsers();
                        
                        ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
                        List<Product> plist = pdao.getAllProducts();
                        
                        CategoryDAO cadao = new CategoryDAO(DAOConnection.sqlconnection());
                        List<Category> calist = cadao.getCategories();
                        
                        OrderDAO odao = new OrderDAO(DAOConnection.sqlconnection());
                        List<Order> olist = odao.getAllOrders();
                    %>
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <h1><%= ulist.size() %></h1>
                                <div class="container">
                                    <h4><b>Number of</b></h4> 
                                    <p><h4><b>Users</b></h4></p>
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
                                <h1><%= plist.size() %></h1>
                                <div class="container">
                                    <h4><b>Number of</b></h4> 
                                    <p><h4><b>Products</b></h4></p>
                                <a href="students.jsp">Click to see Last User</a>
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
                                <h1><%= calist.size() %></h1>
                                <div class="container">
                                    <h4><b>Number of</b></h4> 
                                    <p><h4><b>Category</b></h4></p>
                                <a href="students.jsp">Click to see Last User</a>
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <img src="img/profile.png" alt="Avatar" style="width:50%">
                                <div class="container">
                                    <h4><b>Click to Delete Category</b></h4> 
                                    <a href="products.jsp">Click to see Add Products</a> 
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h1><%= olist.size() %></h1>
                                <div class="container">
                                    <h4><b>Number of</b></h4> 
                                    <p><h4><b>Orders</b></h4></p>
                                <a href="students.jsp">Click to see Last User</a>
                                </div>
                            </div>
                        </div>
                    </div>
                       </div>
            </div>
        </div>
<!-- **************************************************************************************************** -->

<div class="w3-container">
    <div id="category-modal" class="w3-modal">
    <form class="w3-modal-content" action="CategoryServlet" method="post">
        <header class="w3-container" style="text-align: center;"> 
        <span onclick="document.getElementById('category-modal').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>Add Category...</h2>
      </header>
      <div class="w3-container">
           
           <label for="category_name" style="background-color:powderblue;font-size:250%;"><b>Category Name</b></label><br>             
          <input type="text" style="width: 80%;padding: 12px 20px;margin: 8px 0;" placeholder="Enter CAtegory Name" name="cat_name" required><br>
          <label for="category_desp" style="background-color:powderblue;font-size:250%;"><b>Description</b></label><br>
          <input type="text" style="width: 80%;padding: 12px 20px;margin: 8px 0;" placeholder="Enter Description" name="cat_desp" required><br>
        
      </div>
      <footer class="w3-container">
          <button type="submit" style="align-content: center;background-color: #04AA6D;color: white; width: 25%;padding: 14px 20px;margin: 8px 0;border: none; 
  cursor: pointer;">
              Save</button>
       </footer>
    </form>
  </div>
</div>

                 





    </body>
</html>