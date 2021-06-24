<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <style>
 * {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
    border: 5px solid #04AA6D;
  float: left;
  width: 50%;
  padding: 10px;
  height: 400px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row {
    margin-left: 100px;
    margin-top: 100px;
    width: 80%;
  content: "";
  display: table;
  clear: both;
}

#form{
                
                border: 5px solid #04AA6D;
                padding: 40px;
                margin: 0px auto;
                position: relative;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
         <% 
            String phone = session.getAttribute("userphone").toString();
             
            
            String query = "select * from shopping_cart where phone = ?";
            String query1 = "select sum(total) from shopping_cart where phone = ?";
            String query2 = "select count(quantity) from shopping_cart where phone = ?";
            String query3 = "delete from shopping_cart where phone = ? and product_id = ?";
            Connection con = DAOConnection.sqlconnection();
            PreparedStatement ps = con.prepareStatement(query);
            PreparedStatement ps1 = con.prepareStatement(query1);
            PreparedStatement ps2 = con.prepareStatement(query2);
            PreparedStatement ps3 = con.prepareStatement(query3);
            
            ps.setString(1, phone);
            ps1.setString(1, phone);
            ps2.setString(1, phone);
            ps3.setString(1, phone);
            
            ResultSet rs = ps.executeQuery();
            ResultSet rs1 = ps1.executeQuery();
            ResultSet rs2 = ps2.executeQuery();
            
            int cartTotal=0;
            
        %>
        <form action="#" method="post">
            <div class="container">
             <div class="row">
            <div class="column">
                <table border="1">
                    <tr>
                            <th><h3>Product Name</h3></th>
                            <th><h3>Product Quantity</h3></th>
                            <th><h3>Product Price</h3></th>
                            <th><h3>Product Total</h3></th>
                        </tr>
                </table>
               
            </div>
            <div class="column">
                <table border = 1>
            
                                                 
                        <tr>
                            <th><h3>Product Name</h3></th>
                            <th><h3>Product Quantity</h3></th>
                            <th><h3>Product Price</h3></th>
                            <th><h3>Product Total</h3></th>
                        </tr>
                        <%
                            while(rs.next())
                            {
                                int id = rs.getInt(2);
                        %>
                        <tr>
                            <td><input type="hidden" value="pname"><h4><% out.println(rs.getString(6));%></h4></td>
                            <td><h4><% out.println(id);%></h4></td>
                            <td><h4><% out.println(rs.getInt(3)); %></h4></td>
                            <td><h4><% out.println(rs.getInt(4)); %></h4></td>
                            <td><h4><% out.println(rs.getInt(5)); %></h4></td>
                            <td style="text-align:center"><a href="CartsServlet?product_id=<% out.println(id);%>"><button type="button">remove</button></a></td>
                        </tr>
                        <%
                            }  
                        %>
                        </table>
            </div>
            </div>
         </div>
            
            
            
        </form>
        
                         
    </body>
</html>
