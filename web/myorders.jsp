<%@page import="com.myshop.connection.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.dao.OrderDAO"%>
<%@page import="com.myshop.dao.DAOConnection"%>
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
        <div class="container">
            <div id="form">
                <h1>All Orders...</h1>
           
           <% 
                String phone = session.getAttribute("userphone").toString();
                OrderDAO odao = new OrderDAO(DAOConnection.sqlconnection());
                List<Order> olist = odao.getMyOrders(phone);
           %>
            <%                            for (Order o : olist) {
            %>
            <table border="1" style="width: 50%">
                <tr>
                    <td><h3>Order id: <%= o.getOrderId() %></h3>
                        <h3>Product Name : <%= o.getProductName() %></h3>
                        <h3>Product Quantity: <%= o.getProductQuantity() %></h3>
                        <h3>Order Amount : <%= o.getOrderAmount() %></h3>
                        <h3>Order Date : <%= o.getOrderDate() %></h3>
                    </td>
                <br>
                </tr>
            </table>
            <%
                }
            %>
            </div>
           
        </div>

    </body>
</html>
