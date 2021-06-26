<%@page import="com.myshop.connection.User"%>
<%@page import="com.myshop.connection.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.dao.ProductDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.Connection"%>
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
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
           
            .container {
                padding: 20px;
            }

            .navbar{
                width: 100%;
                background-color: #555;
                overflow: auto;
            }

            .navbar a{
                float: left;
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

            .sticky {
                position: fixed;
                top: 0;
                width: 100%;
            }

            .sticky + .container {
                padding-top: 60px;
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
        <div class="container">

            <h1>All Products..</h1>
            <%                    ProductDAO pdao = new ProductDAO(DAOConnection.sqlconnection());
                List<Product> list = pdao.getAllProducts();


            %>

            <%                            for (Product p : list) {
            %>
            <table border="1">
                <tr>
                    <td><img src="img/products/<%= p.getpImage()%>" style="width:50%"></td>
                    <td>    <h3>Product id: <%= p.getpId()%></h3>
                        <h3>Product Name: <%= p.getpName()%></h3>
                        <h3>Product Price: <%= p.getpPrice()%></h3>
                        <h3>Product Discount: <%= p.getpDiscount()%>%</h3>
                        <h3>Product DiscountPrice: <%= p.getPriceAfterDiscount()%></h3>
                        <h3>Product Qty : <%= p.getpQty()%></h3>
                        <h3>Product Description : <%= p.getpDescription()%></h3>
                    </td>
                </tr>
            </table>
            <%
                }
            %>
       </div>
    </body>
</html>
