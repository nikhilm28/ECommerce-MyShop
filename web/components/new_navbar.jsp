<%@page import="java.util.List"%>
<%@page import="com.myshop.connection.Category"%>
<%@page import="com.myshop.dao.CategoryDAO"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="com.myshop.connection.User"%>
<%
        User user1 = (User)session.getAttribute("current-user");
        


%>
<style>
  body {
  font-family: Arial, Helvetica, sans-serif;
}

.dropdown {
  float: left;
  overflow: auto;
}

.dropdown .dropbtn {
  font-size: 17px;  
  border: none;
  outline: none;
  color: white;
  padding: 25px;
  background-color: inherit;
  font-family: inherit;
  
}

.dropdown:hover .dropbtn {
  background-color: #000;
}

.dropdown .dropdown-content {
  display: none;
  position: absolute;
  background-color: #555;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown .dropdown-content a {
  float: none;
  color: white;
  padding: 25px;
  text-decoration: none;
  display: block;
 
}

.dropdown-content a:hover {
  background-color: #000;
}

.dropdown:hover .dropdown-content {
  display: inherit;
}  
</style>
<body>
   <div class="wrapper">
    <div class="sidebar">
        <h2>MyShop</h2>
        
            <a href="#"><i class="fas fa-project-diagram"></i>Category</a>
           <button class="dropdown-btn">Category 
                <i class="fa fa-caret-down"></i>
            </button>
            
            <div class="dropdown-container">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
            </div>
    
           
           <a href="#"><i class="fas fa-home"></i>My Account</a>
           <a href="#"><i class="fas fa-user"></i>My Orders</a>
           <a href="#"><i class="fas fa-address-card"></i>My Wishlist</a>
           <a href="#"><i class="fas fa-project-diagram"></i>portfolio</a>
           <a href="#"><i class="fas fa-blog"></i>Blogs</a>
           <a href="#"><i class="fas fa-address-book"></i>Contact</a>
           <a href="#"><i class="fas fa-map-pin"></i>Map</a>
    
        <div class="social_media">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
    
    
    
    <div class="main_content">
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn">Category
                    <i class="fa fa-caret-down"></i>
                </button>
                <% 
                    CategoryDAO cdao = new CategoryDAO(DAOConnection.sqlconnection());
                    List<Category> clist = cdao.getCategories();
                    
                %>
                <div class="dropdown-content">
                    <a href="index.jsp?category=all">All</a>
                    <%
                        for(Category c : clist)
                                {
                    %>
                    <a href="index.jsp?category=<%= c.getCatId() %>"><%= c.getCategoryName()%></a>
                    <% } %>
                    
                </div>
            </div> 
                    <a href="#!" data-toggle="w3-modal" data-target="#id01" onclick="document.getElementById('id01').style.display='block'"> <i class="fa fa-fw fa-cart-plus" style="font-size:20px" ></i><span class="cart-items">( 0 )</span></a>
            <%
               if(user1 == null)
                 {
            %>
            <a href="register.jsp"> <i class="fa fa-fw fa-address-book"></i>Register</a>
            <a href="login.jsp"> <i class="fa fa-fw fa-user"></i>Login</a>
            <a class="active" href="index.jsp"> <i class="fa fa-fw fa-home"></i>Home</a>
            <%
                }
                else if(user1.getUsertype().equals("admin")) 
                {
            %>          
            <a href="LogoutServlet"> <i class="fa fa-fw fa-address-book"></i>Logout</a>
            <a href="#"><i class="fa fa-fw fa-user"></i><%= user1.getName() %></a>
            <a class="active" href="admin.jsp"> <i class="fa fa-fw fa-home"></i>Dashboard</a>
            
           
            <%
                }
                else
                {
            %>
                 <a href="LogoutServlet"> <i class="fa fa-fw fa-address-book"></i>Logout</a>
            <a href="#"><i class="fa fa-fw fa-user"></i><%= user1.getName() %></a>
            <a class="active" href="index.jsp"> <i class="fa fa-fw fa-home"></i>Home</a>
            <%
                }
            %>
                              
            </div>  
        
    </div>
</div>
             
</body>
