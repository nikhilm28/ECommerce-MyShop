<%@page import="com.myshop.connection.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page import="java.sql.Connection"%>
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
        <style>
            @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style: none;
                text-decoration: none;
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
            .column {
                background-color:#bbb;
                border: 1px solid #04AA6D;
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
            .imgcontainer {
                text-align: center;
                margin: 15px 0 20px 0;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }
            #form{

                border: 5px solid #04AA6D;
                padding: 40px;

                width: 450px;
                margin: 0px auto;
                position: relative;
            }
            .container {
                padding: 20px;
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

                    <%                             String phone = session.getAttribute("userphone").toString();
                        int productId = Integer.parseInt(request.getParameter("productid"));

                        String query = "select * from shopping_cart where phone = ? and product_id = ?";
                        String query1 = "select * from user_info where phone = ?";
                        String query2 = "select * from(select count(product_id) from shopping_cart where phone=? and product_id = ?)as qty";

                        Connection con = DAOConnection.sqlconnection();
                        PreparedStatement ps = con.prepareStatement(query);
                        PreparedStatement ps1 = con.prepareStatement(query1);
                        PreparedStatement ps2 = con.prepareStatement(query2);

                        ps.setString(1, phone);
                        ps.setInt(2, productId);
                        ps1.setString(1, phone);
                        ps2.setString(1, phone);
                        ps2.setInt(2, productId);

                        ResultSet rs = ps.executeQuery();
                        ResultSet rs1 = ps1.executeQuery();
                        ResultSet rs2 = ps2.executeQuery();

                        int sno = 0;
                        int cartTotal = 0;
                        int qty = 0;
                        int id = 0;
                    %>
                    <div id="form">
                        
                            <div class="imgcontainer">
                                <h1>Checkout Page</h1>
                            </div>

                            <div class="container">




                                <table border="1" style="width: 100%">


                                    <tr>
                                        <th><h3>Sr. No.&nbsp;</h3></th>
                                        <th><h3>Product Name  </h3></th>
                                        <th><h3>Quantity </h3></th>
                                        <th><h3>Net Price </h3></th>
                                        <th><h3>Total Amount </h3></th>
                                    </tr>
                                    <%   while (rs2.next()) {
                                            int y = rs2.getInt(1);
                                            qty = qty + y;
                                            
                                            
                                            

                                        }
                                    %>
                                    <%
                                        while (rs.next()) {
                                            id = rs.getInt(2);
                                            sno = sno + 1;
                                            if(qty==1)
                                            {
                                              cartTotal = rs.getInt(4);

                                              
                                            }
                                            else{
                                                cartTotal = rs.getInt(4);
                                            cartTotal = cartTotal * qty;
                                            }

                                    %>

                                    <tr>
                                        <td style="text-align:center"><h4><% out.println(sno);%></h4></td>
                                        <td style="text-align:center"><h4><% out.println(rs.getString(6));%></h4></td>
                                        <td style="text-align:center"><h4><% out.println(qty); %></h4></td>
                                        <td style="text-align:center"><h4><% out.println(rs.getInt(4)); %></h4></td>
                                        <td style="text-align:center"><h4><% out.println(cartTotal); %></h4></td>

                                    </tr>
                                    <tr><td></td><td></td><td></td><td style="text-align:center"><h3>Total:</h3></td><td style="text-align:center"><h3><% out.println(cartTotal); %></h3></td></tr>
                                                <%
                                                        break;
                                                    }
                                                %>


                                </table>
                                <br>

                                <%
                                    while (rs1.next()) {
                                %>

                                <h3>Name: <% out.println(rs1.getString(2)); %></h3>
                                <h3>Mobile No: <% out.println(rs1.getString(3)); %></h3>
                                <h3>Email: <% out.println(rs1.getString(4)); %></h3>
                                <h3>Address : <% out.println(rs1.getString(5)); %></h3>
                                <h3>Zipcode : <% out.println(rs1.getString(6)); %></h3>

                                <%
                                    }
                                %>


                             </div>
                            <div class="container">
                                <a href="OrderServlet?productid=<% out.println(id);%>&pname=<% out.println(rs.getString(6));%>&pqty=<% out.println(qty);%>&pamount=<% out.println(cartTotal);%>"><button type="button">Place Order</button></a>
                            </div>
                        
                    </div>

                </div>
            </div>




        </div>



    </body>
</html>
