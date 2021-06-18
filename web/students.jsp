<%-- 
    Document   : students
    Created on : 31-Dec-2020, 8:27:11 PM
    Author     : nikhil
--%>
<%@page import="java.sql.*" %>
<%@page import="com.myshop.dao.DAOConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers INFO</title>
        Customer's
    </head>
    <body>
        <h1>Customer Info</h1>
        <% 
            Connection con = DAOConnection.sqlconnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info order by u_id desc limit 1;");
            
        %>
        <table border ='1'>
            <tr>
                <th> Customer_id</th>
                <th> Title </th>
                <th> Name</th>
                <th> Phone</th>
                <th> Address</th>
                <th> Zipcode</th>
                <th> Password</th>
                <th> UserType </th>
                
 
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
    </body>
</html>
