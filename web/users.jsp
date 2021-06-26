<%@page import="com.myshop.connection.User"%>
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
        <title>User Info..</title>
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
            <h1>User Info</h1>
            <%
                Connection con = DAOConnection.sqlconnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from user_info");

            %>
            <table border ='1'>
                <tr>
                    <th> User_id</th>
                    <th> User Name </th>
                    <th> Phone</th>
                    <th> Email</th>
                    <th> Address</th>
                    <th> Zipcode</th>
                    <th> Password</th>
                    <th> UserType </th>


                </tr>
                <%while (rs.next()) { %>
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
                <% }%>
            </table>
        </div>


    </body>
</html>
