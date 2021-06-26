<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myshop.connection.Product"%>
<%@page import="com.myshop.dao.ProductDAO"%>
<%@page import="com.myshop.connection.Cart"%>
<%@page import="com.myshop.dao.CartDAO"%>
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

    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
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

            button {
                background-color: #04AA6D;
                color: white;
                font-size: 15px;
                padding: 13px 25px;
                margin: 8px 1px;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            #form{

                border: 5px solid #04AA6D;
                width: 750px;
                padding: 20px;
                margin: 0px auto;
                position: relative;
            }

            button:hover {
                opacity: 0.8;
            }

            .container {
                padding: px;
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
            <a href="index.jsp"> <i class="fa fa-fw fa-home"></i>Home</a>
        </div>
        <div class="wrapper">                                
            <div class="main_content">
                <div class="info">

                    <%  
                        String phone = session.getAttribute("userphone").toString();
                        String query = "select * from shopping_cart where phone = ?";
                        String query1 = "select sum(total) from shopping_cart where phone = ?";
                        String query2 = "select count(quantity) from shopping_cart where phone = ?";
                        Connection con = DAOConnection.sqlconnection();
                        PreparedStatement ps = con.prepareStatement(query);
                        PreparedStatement ps1 = con.prepareStatement(query1);
                        PreparedStatement ps2 = con.prepareStatement(query2);
                        ps.setString(1, phone);
                        ps1.setString(1, phone);
                        ps2.setString(1, phone);
                        ResultSet rs = ps.executeQuery();
                        ResultSet rs1 = ps1.executeQuery();
                        ResultSet rs2 = ps2.executeQuery();
                        int cartTotal = 0;

                    %>
                    <div id="form">
                        <form>
                            <h1>My Cart....</h1>
                            <table border = 1>


                                <tr>
                                    <th><h3>Product Name</h3></th>
                                    <th><h3>Product Quantity</h3></th>
                                    <th><h3>Product Price</h3></th>
                                    <th><h3>Product Total</h3></th>
                                </tr>
                                <%                            while (rs.next()) {
                                        int id = rs.getInt(2);
                                %>
                                <tr>
                                    <td style="text-align:center"><h4><% out.println(rs.getString(6));%></h4></td>
                                    <td style="text-align:center"><h4><% out.println(rs.getInt(3)); %></h4></td>
                                    <td style="text-align:center"><h4><% out.println(rs.getInt(4)); %></h4></td>
                                    <td style="text-align:center"><h4><% out.println(rs.getInt(5)); %></h4></td>
                                    <td style="text-align:center"><a href="CartsServlet?productid=<% out.println(id);%>"><button type="button" style="background-color:#ff0000">remove</button></a></td>
                                    <td style="text-align:center"><a href="checkout.jsp?productid=<% out.println(id);%>&pname=<% out.println(rs.getString(6));%>"><button type="button">Buy Now</button></a></td>
                                </tr>
                                <%

                                    }
                                %>
                                <tr>

                                    <%
                                        while (rs1.next()) {

                                            int x = rs1.getInt(1);
                                            cartTotal = cartTotal + x;

                                        }
                                    %>

                                </tr>
                                <tr><td></td><td></td><td style="text-align:center"><h3>Total:</h3></td><td style="text-align:center"><h3><% out.println(cartTotal); %></h3></td></tr>
                            </table>
                            <div class="container">
                                <%
                                    if (cartTotal == 0) {
                                %>
                                <h1>Cart is Empty</h1>  
                                <% }%>
                            </div>
                            <div class="container">
                                <a href="#"><button>Place Order</button></a>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

