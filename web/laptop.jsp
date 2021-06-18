<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <% 
            Connection con = DAOConnection.sqlconnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product order by product_id desc limit 1;");
            
        %>
        <table border ='1'>
            <tr>
                <th> Product_id</th>
                <th> Name </th>
                <th> Price</th>
                <th> Discount</th>
                <th> Quantity</th>
                <th> Description</th>
                <th> Category_id</th>
                <th> Image </th>
                
 
            </tr>
            <%while(rs.next()) { %>
            <tr>
              <td><%out.println(rs.getInt(1)); %></td>
	<td><%out.println(rs.getString(2)); %></td>
	<td><%out.println(rs.getString(3)); %></td>
	<td><%out.println(rs.getString(4)); %></td>
	<td><%out.println(rs.getString(5)); %></td>
	<td><%out.println(rs.getString(6)); %></td>
	<td><%out.println(rs.getString(7)); %></td>
	<td><%out.println(rs.getString(8)); %></td>
	  
            </tr>
            <% } %>
        </table>
<div id="form">
    <form action="LaptopServlet" method="post">
        <div class="imgcontainer">
            <h2> Add Laptop Details...</h2>
        </div>
        
        <div class="container">     
            <table style="width: 80%">
                <tr>
                    <td>Laptop Brand</td>
                    <td><input type="text" name="lBrand" required></td>
                </tr>
                <tr>
                    <td>Ram</td>
                    <td><input type="text" name="lRam" required></td>
                </tr>
                <tr>
                    <td>Rom</td>
                    <td><input type="text" name="lRom" required></td>
                </tr>
                <tr>
                    <td>CPU</td>
                    <td><input type="text" name="lCPU" required></td>
                </tr>
                <tr>
                    <td>CPU Type</td>
                    <td><input type="text" name="lCPUType" required></td>
                </tr>                                                            
                <tr>
                    <td>Graphics</td>
                    <td><input type="text" name="lGraphics" required></td>
                </tr>                                                            
                <tr>
                    <td>Display</td>
                    <td><input type="text" name="lDisplay" required></td>
                </tr>
                <tr>
                    <td>CPU Speed</td>
                    <td><input type="text" name="lCPUSpeed" required></td>
                </tr>
                <tr>
                    <td>Weight</td>
                    <td><input type="text" name="lWeight" required></td>
                </tr>
                <tr>
                    <td>Product Id</td>
                    <td><input type="text" name="product_id" required></td>
                </tr>
                
            </table>
                <button type="submit" >Add Laptop</button>

        </div>
    </form>
    
</div>
    </body>
</html>

