 <%@page import="java.util.List"%>
<%@page import="com.myshop.connection.Category"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="com.myshop.dao.CategoryDAO"%>
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
        <title>JSP Page</title>
        <style>
    @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text] {
  width: 80%;
  padding: 12px 20px;
  margin: 8px 15px;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

textarea {
    width: 80%;
  padding: 12px 20px;
  margin: 8px 15px;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
select {
        width: 200px;
        padding: 12px 20px;
        margin: 8px 15px;
    }
    select:focus {
        min-width: 0px;
        width: auto;
    }

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

#form{
    height: 300px;
    width: 500px;
    padding: 20px;
    margin: 0px auto;
    position: relative;
}

button:hover {
  opacity: 0.8;
}

.imgcontainer {
  text-align: center;
  margin: 15px 0 20px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 20px;
}

span.psw {
  float: right;
  padding-top: 1px;
}

.navbar{
  width: 100%;
  background-color: #555;
  overflow: auto;
}

.navbar a{
    float: right;
    text-align: center;
    padding: 25px;
    color: white;
    text-decoration: none;
    font-size: 17px;
}

.navbar a:hover{
    background-color: #000;
}

.active {
  background-color: #04AA6D;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
}
</style>
    </head>
    <body>
        <div class="navbar">                     
            <a href="admin.jsp"> <i class="fa fa-fw fa-home"></i>Dashboard</a>
        </div>
<div id="form">
    <form action="ProductServlet" method="post" enctype="multipart/form-data">
        <div class="imgcontainer">
            <h2> Add Product Details...</h2>
            <%@include  file="components/alert.jsp" %>
            <%@include  file="components/success.jsp" %>
        </div>
        
        <div class="container">
            <table style="width: 80%">
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="pName" required></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="pPrice" required></td>
                </tr>
                <tr>
                    <td>Discount</td>
                    <td><input type="text" name="pDiscount" required></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="text" name="pQuantity" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="pDescription" rows="4" cols="35" required></textarea>
                </tr>
                
                <tr>
                    <%
                        CategoryDAO cdao = new CategoryDAO(DAOConnection.sqlconnection());
                        List<Category> list = cdao.getCategories();
                    %>
                    <td>Category</td>
                    <td><select name="catId">
                            <%
                                for(Category c : list)
                                {
                            %>
                            
                            <option value="<%= c.getCatId()%>"> <%= c.getCategoryName()%> </option>
                            
                            <% } %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Upload Image</td>
                    <td><input type="file" name="pPic" required></td>
                </tr>
            </table>
                <button type="submit" >Add Product</button>

        </div>
    </form>
    
</div>
    </body>
</html>
